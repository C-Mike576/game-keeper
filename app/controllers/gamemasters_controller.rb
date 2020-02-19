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
        if @gamemaster.user_id != session[:user_id]
            redirect_to gamemaster_notes_path(@gamemaster)
        end
    end
    
    def edit 
        @gamemaster = Gamemaster.find_by_id(params[:id])
    end

    def update
        @gamemaster = Gamemaster.find_by_id(params[:id])
        @gamemaster.update(params.require(:gamemaster).permit(:name))
        if @gamemaster.valid?
            redirect_to gamemaster_path(@gamemaster)
        else
            render :edit
        end
    end
end
