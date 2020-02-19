class SessionsController < ApplicationController
  
  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  def new
  
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now.alert = "Invalid email or password"
      render :new
    end
  end

  def omniauth
    @user = User.find_or_create_by(uid: auth[:uid]) do |u|
      u.username = auth[:info][:email]
      u.email = auth[:info][:email]
      u.password = SecureRandom.hex
    end

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:message] = @user.errors.full_messages
      redirect_to '/signup'
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
