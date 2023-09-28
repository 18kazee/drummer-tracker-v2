class DrummersController < ApplicationController
  def index
    @drummers = Drummer.all.page(params[:page])
  end

  def show
    @drummer = Drummer.find(params[:id])
  end
end
