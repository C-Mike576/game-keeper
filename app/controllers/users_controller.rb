class UsersController < ApplicationController

    def show
        @user = User.find_by_id(params[:id])
    end

    def new
        if logged_in?
            redirect_to user_path(current_user)
        else
            @user = User.new
        end
    end

    def create 
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
    end

private

  def user_params
    params.require(:user).permit(:username, :role, :password, :email)
  end

end
