class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.today_posts.includes(:user)
  end


  def new
    if current_user.posted_today?
      redirect_to my_posts_posts_path
    else
      @post = Post.new
    end
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unpocessable_entity
    end
  end

  def my_posts
    @posts = current_user.posts
    if current_user.posted_today?
      @today_post = current_user.posts.today_posts
    else
      redirect_to new_post_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
