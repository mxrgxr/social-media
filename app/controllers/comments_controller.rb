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
      render 'comments/form'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :parent_id)
  end
end
