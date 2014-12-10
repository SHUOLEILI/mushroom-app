class AdminSessionsController < ApplicationController

  def create
    user = Admin.where(:email => params[:admin_sessions][:email].downcase).first

    if user.password == params[:admin_sessions][:password]
      session[:email] = user.email

      @admin = user
      @consumer = Consumer.all
      render 'dashboard'
    else
      flash[:notice] = 'Invalid email/password combination'
      redirect_to '/adminlogin'
    end
  end

  def delete
      Consumer.where(email: params[:email]).delete
      @admin = user
      @consumer = Consumer.all
      render 'dashboard'
  end

end