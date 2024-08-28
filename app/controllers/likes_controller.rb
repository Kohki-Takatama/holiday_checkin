class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    current_user.likes.create(post_id: @post.id)
  end
end
