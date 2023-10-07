class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post), notice: t('defaults.message.created', item: Comment.model_name.human)
    else
      flash.now[:alert] = t('defaults.message.not_created', item: Comment.model_name.human)
      render 'posts/show',status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
