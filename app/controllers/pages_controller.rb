class PagesController < ApplicationController
  def index
  end

  def home
  end

  def profile
    # grab the username from the URL as: id
    if(User.find_by_username(params[:id]))
    @username = params[:id]
    else
    redirect_to root_path, :notice => "User Not Found!"
    end
  end

  def explore
  end
end
