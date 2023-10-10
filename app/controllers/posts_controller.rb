# frozen_string_literal: true

class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user, :drummer).page(params[:page]).order('created_at DESC')
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      post_saved
    else
      post_not_saved
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user).order('created_at ASC')
    @comment = Comment.new
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: t('defaults.message.delete', item: Post.model_name.human)
  end

  private

  def post_params
    params.require(:post).permit(:tweet, :user_id, :drummer_id)
  end

  def post_saved
    flash.now[:notice] = t('defaults.message.created', item: Post.model_name.human)
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to posts_path }
    end
  end

  def post_not_saved
    flash.now[:alert] = t('defaults.message.not_created', item: Post.model_name.human)
    respond_to do |format|
      format.turbo_stream
    end
  end
end
