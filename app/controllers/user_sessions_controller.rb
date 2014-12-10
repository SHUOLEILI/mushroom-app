class UserSessionsController < ApplicationController

  def create
    user = Consumer.where(:email => params[:user_sessions][:email].downcase).first
    @consumer = user
    if user.password == params[:user_sessions][:password]
      session[:email] = user.email

      @musics = Music.all(email: user.email)

      render 'dashboard'
    else
      flash[:notice] = 'Invalid email/password combination'
      redirect_to '/login'
    end
  end

  def upload
    begin

      @consumer = Consumer.where(:email => session[:email]).first

      name = params[:upload][:file].original_filename
      directory = "public/mp3"
      path = File.join(directory, name)
      File.open(path, "wb") { |f| f.write(params[:upload][:file].read) }

      email = session[:email]

      music = Music.new(email: email, url: path, name: name)
      music.save

      @musics = Music.all(email: email)

      render 'dashboard'
    end
  end

  def delete
    if (params[:mp3file])

      redirect_to root_path
    else
      render :text => "No mp3 was found to delete!"
    end
  end

  def editProfile
    password1 = params[:user_sessions][:password]
    password2 = params[:user_sessions][:password]

    if(password1 == password2)
      email = session[:email]
      username = params[:user_sessions][:username]
      name = params[:user_sessions][:name]
      gender = params[:user_sessions][:gender]
      age = params[:user_sessions][:age]

      Consumer.where(email: email).update(username: username, password: password1, name: name, gender: gender, age: age)


      @consumer = Consumer.where(:email => session[:email]).first
      @musics = Music.all(email: email)
      flash[:notice] = 'Successfully Updated'
      render 'dashboard'
    else
      @consumer = Consumer.where(:email => session[:email]).first
      @musics = Music.all(email: email)
      flash[:notice] = 'Updated Failed'
      render 'dashboard'
    end
  end
end

