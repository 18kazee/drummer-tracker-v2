# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_post, only: [:create]
  before_action :set_comment, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    return unless @comment.save

    flash.now.notice = t('defaults.message.created', item: Comment.model_name.human)
  end

  def destroy
    @comment.destroy
    flash.now.notice = t('defaults.message.delete', item: Comment.model_name.human)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
