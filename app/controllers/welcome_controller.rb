class WelcomeController < ApplicationController
  def index
  end

  def sign_out
    reset_session
    redirect_to action: :index
  end
end
