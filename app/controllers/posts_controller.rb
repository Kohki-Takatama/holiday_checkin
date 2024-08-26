class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.today_posts.includes(:user)
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

  def today
    if current_user.posted_today?
      @post = current_user.posts.today_posts
    else
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
