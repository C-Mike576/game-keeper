class GamemastersController < ApplicationController

    def new
        @gamemaster = Gamemaster.new
    end

    def create 
        @gamemaster = Gamemaster.new(params.require(:gamemaster).permit(:name))
        @gamemaster.user_id = current_user.id
        if @gamemaster.save
            redirect_to gamemaster_path(@gamemaster)
        else
            render :new
        end
    end

    def show
        @gamemaster = Gamemaster.find_by_id(params[:id])
    end
    
    def destroy
        Gamemaster.find_by_id(params[:id]).delete
        flash.now.alert = "Gamemaster Delete Successful"
        redirect_to user_path(current_user)
    end

end
