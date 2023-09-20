class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    @comment.parent_id = params[:comment][:parent_id]

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
