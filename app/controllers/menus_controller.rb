class MenusController < ApplicationController
  def index
    render json: {menu: "maeda"}
  end
end