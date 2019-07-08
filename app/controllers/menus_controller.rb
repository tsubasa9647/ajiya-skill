require 'http'
require 'json'
require 'nokogiri'
require 'open-uri'

class MenusController < ApplicationController
  def index
    ajiya_uri = 'http://ajiya1.com/'
    ajiya_page = URI::parse(ajiya_uri).read()
    ajiya_doc = Nokogiri::HTML::parse(ajiya_page)

    dairy_uri = ajiya_doc.css('.rpwe-block').css('.rpwe-title').css('a')[0][:href]
    # puts dairy_uri

    dairy_page = URI::parse(dairy_uri).read()
    dairy_doc = Nokogiri::HTML::parse(dairy_page)

    bento = dairy_doc.css('.entry-content')
    bento_str = bento.to_html.gsub(%r{</?[^>]+?>},'').strip.gsub('●','').chomp
    response = {
      payload: {
        google: {
          expentUserRespnse: false,
            richResponse: {
              items: [
                  {
                    simpleResponse: {
                      textToSpeech: bento_str
                    }
                  }
              ]
            }
        }
      }
    }
    render json: response 
  end
end