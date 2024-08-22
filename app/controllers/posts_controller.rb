class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.includes(:user)
  end

  def show
    @post = current_user.posts.last
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unpocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
