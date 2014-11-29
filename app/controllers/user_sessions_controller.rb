class UserSessionsController < ApplicationController
  def new
    @user = Consumer.new
  end

  def create
    user = Consumer.where(:email => params[:user_sessions][:email].downcase).first
    if user.password == params[:user_sessions][:password]
      redirect_to user
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
