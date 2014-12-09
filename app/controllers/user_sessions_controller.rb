class UserSessionsController < ApplicationController
  def new
    @user = Consumer.new
  end

  def create
    user = Consumer.where(:email => params[:user_sessions][:email].downcase).first
    if user.password == params[:user_sessions][:password]
      session[:email] = user.email

      @musics = Music.all(email: email)

      render 'dashboard'
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def upload
    begin
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



end
