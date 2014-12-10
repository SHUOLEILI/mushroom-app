class ConsumersController < ApplicationController
  def new
    @user = Consumer.new
  end

  def create
    email = params[:consumers][:email]
    password1 = params[:consumers][:password]
    password2 = params[:consumers][:password]

    if(Consumer.where(name: email).count == 0 && password1 == password2)

      username = params[:consumers][:username]
      name = params[:consumers][:name]
      gender = params[:consumers][:gender]
      age = params[:consumers][:age]

      consumer = Consumer.new(email: email, username: username, password: password1, name: name, gender: gender, age: age)
      consumer.save

      flash[:notice] = 'Successfully Registration'
      redirect_to '/login'
      
    else
      flash[:notice] = 'User is already exist or Password 1 is not equal Password 2'
      redirect_to '/signup'
    end
  end
end
