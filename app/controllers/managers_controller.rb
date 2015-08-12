class ManagersController < ApplicationController

  def show
  end

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(params.require(:manager).permit(:username))
    # move the above to strong_params
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
    if !@manager # unless @manager
      flash[:notice] = "This manager doesn't exist!"
      redirect_to action: :sign_in
    else
      flash[:notice] = "You're signed in, #{@manager.username}!"
      session[:manager_id] = @manager.id
      session[:user_id] = nil
      redirect_to manager_path(@manager)
    end
  end

end
