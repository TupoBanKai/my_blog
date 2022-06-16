class CommentsController < ApplicationController
  before_action :find_post, only: [:index, :new, :create]
  before_action :find_comment, only: [:destroy, :edit, :update]

  def index
    @comments = @post.comments
  end

  def new
    @comment = @post.comments.new()
  end

  def create
    @comment = current_user.comments.create(comment_params)

    if @comment.save!
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path
  end

  def update
    if @comment.update(comemnt_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def edit
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
