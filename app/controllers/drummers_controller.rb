# frozen_string_literal: true

class DrummersController < ApplicationController
  def index
    @drummers = Drummer.includes(:artists, :genres).all.page(params[:page]).order('created_at asc')
  end

  def show
    @drummer = Drummer.find(params[:id])
  end

  def search
    @q = Drummer.ransack(params[:q])
    @drummers = @q.result(distinct: true).includes(:artists, :genres).order(:name).page(params[:page])
  end

  def modal
    @drummer = Drummer.find(params[:id])
  end
end
