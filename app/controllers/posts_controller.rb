class PostsController < ApplicationController
  before_action :find_post, only: [:show]
  before_action :sort_posts, only: [:index]

  def index
    @posts
  end

  def show
    @post
  end

  private

  def sort_posts
    if params[:sort_by].present?
      case params[:sort_by]
      when "asc"
        @posts = Post.sort_posts_by_asc
      when "old"
        @posts = Post.sort_posts_by_old
      when "popular"
        @posts = Post.sort_by_comments
      end
    else
      @posts = Post.all
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
