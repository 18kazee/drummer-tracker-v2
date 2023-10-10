# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :set_post, only: %i[create destroy]

  def create
    current_user.like(@post)
    respond_to do |format|
      format.turbo_stream
    end
  end

  def destroy
    current_user.unlike(@post)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
