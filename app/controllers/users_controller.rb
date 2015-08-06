class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = Post.all
  end

  def oauth_create
    @user = User.from_auth( request.env["omniauth.auth"])
    session[:manager_id] = nil
    session[:user_id] = @user.id
    redirect_to @user
  end
end
