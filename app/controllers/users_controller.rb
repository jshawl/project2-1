class UsersController < ApplicationController
  def welcome
  end

  def show
    @user = User.find(session[:user]["id"])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username))
    if @user.save
      redirect_to action: :sign_in
    else
      flash[:notice] = "Could not create account..."
      render :new
    end
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      flash[:notice] = "This user doesn't exist!"
      redirect_to action: :sign_in
    else
      flash[:notice] = "You're signed in, #{@user.username}!"
      session[:user] = @user
      redirect_to user_path(@user)
    end
  end
end
