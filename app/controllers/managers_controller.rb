class ManagersController < ApplicationController

  def show
    @manager = Manager.find(session[:manager]['id'])
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(params.require(:manager).permit(:username))
    if @manager.save
      redirect_to action: :sign_in
    else
      flash[:notice] = "Could not create account..."
      render :new
    end
  end


  def sign_in
  end

  def sign_in!
    @manager = Manager.find_by(username: params[:username])
    if !@manager
      flash[:notice] = "This manager doesn't exist!"
      redirect_to action: :sign_in
    else
      flash[:notice] = "You're signed in, #{@manager.username}!"
      session[:manager] = @manager
      session[:user] = nil
      redirect_to manager_path(@manager)
    end
  end

end
