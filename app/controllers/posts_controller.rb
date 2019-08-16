class PostsController < ApplicationController

  before_action :move_to_index, except: :index

def index
  @posts = Post.includes(:user).page(params[:page]).per(8).order("created_at DESC")
end

def new
end

def create
  Post.create(text: post_params[:text], user_id: current_user.id)
  redirect_to controller: :posts, action: :index
end


  def destroy
    post = Post.find(params[:id])
    if post.user_id == current_user.id
      post.destroy
    end
  end

def edit
  @post = Post.find(params[:id])
end

def update
  post = Post.find(params[:id])
  if post.user_id == current_user.id
    post.update(post_params)
  end

  redirect_to controller: :posts, action: :index
end
private
def post_params
  params.permit(:text)
end
def move_to_index
  redirect_to action: :index unless user_signed_in?
end

end
