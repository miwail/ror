class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #binding.pry
    if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to user_path(user)
    else
      puts params[:session]
      render 'new'
    end
  end

  def destroy
  end
end
