class SessionsController < ApplicationController
  
  def destroy
    session.delete(:user_id)
    redirect_to '/login'
  end

  def new
  
  end

  def create
    @user = User.find_by(email: params[:email])
   if @user && @user.authenticate(params[:password])
      sessions[:user_id] = @user.id
      redirect_to user_path(@user)
   else
      render '/login'
   end
  end

end
