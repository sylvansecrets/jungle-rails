class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      puts "Message here marker", session[:user_id]
      redirect_to '/'
    else
      redirect_to '/session/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/session/new'
  end

end