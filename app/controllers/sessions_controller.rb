class SessionsController < ApplicationController
  def new
  end
  def create
    #user = User.find_by(name: params[:session][:name])
    user_d = User.find_by(email: params[:session][:email].downcase)
    if user_d
      log_in user_d
      redirect_to user_d
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
        log_out
    redirect_to root_url
  end
end
