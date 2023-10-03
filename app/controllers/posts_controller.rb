class PostsController < ApplicationController

  def index
    @posts = Post.includes(:user, :drummer).page(params[:page]).order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end
end
