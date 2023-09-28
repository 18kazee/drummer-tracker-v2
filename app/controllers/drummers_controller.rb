class DrummersController < ApplicationController
  def index
    @drummers = Drummer.includes(:artists, :genres).all.page(params[:page]).per(10).order('created_at asc')
  end

  def show
    @drummer = Drummer.find(params[:id])
  end
end
