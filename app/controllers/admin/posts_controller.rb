class Admin::PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy, :edit]

  def index
    @posts = Post.all
  end

  def show
    @comments = @post.comments
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def update
    if @post.update(post_params)
      redirect_to [:admin, @post]
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
