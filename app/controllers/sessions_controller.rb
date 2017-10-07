class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(name: params[:session][:name])
    user_d = User.find_by(email: params[:session][:email].downcase)
    if user ==user_d
      log_in user
      redirect_to user
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
  end
end
