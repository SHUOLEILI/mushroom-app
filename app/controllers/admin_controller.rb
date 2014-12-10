class AdminController < ApplicationController
  def new
    @user = Admin.new
  end

  def create
    email = params[:admin][:email]
    password1 = params[:admin][:password]
    password2 = params[:admin][:password]

    if(Consumer.where(name: email).count == 0 && password1 == password2)


      admin = Admin.new(email: email, password: password1)
      admin.save

      flash[:notice] = 'Successfully Registration'
      redirect_to '/adminlogin'

    else
      flash[:notice] = 'User is already exist or Password 1 is not equal Password 2'
      redirect_to '/adminsignup'
    end
  end
end
