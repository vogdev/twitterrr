class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
  end

  def profile
    # grab the username from the URL as: username
    # in the tutorial that man used params[:id] to get the username
    if(User.find_by_username(params[:username]))
      @username = params[:username]
    else
      redirect_to root_path, :notice => "User Not Found!"
    end
    @posts = Post.all.where("user_id= ?", User.find_by_username(params[:username]).id)
    @newPost = Post.new
  end

  def explore
    @posts = Post.all
  end
end
