class GamemastersController < ApplicationController
    before_action :require_login
    before_action :find_gamemaster
    skip_before_action :find_gamemaster, only: [:new, :create]

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
        if @gamemaster.user_id != session[:user_id]
            redirect_to gamemaster_notes_path(@gamemaster)
        end
    end
    
    def edit 
    end

    def update
        @gamemaster.update(params.require(:gamemaster).permit(:name))
        if @gamemaster.valid?
            redirect_to gamemaster_path(@gamemaster)
        else
            render :edit
        end
    end


    private

    def find_gamemaster
        @gamemaster = Gamemaster.find_by_id(params[:id]) 
        if @gamemaster == nil
            redirect_to user_path(current_user)
        end

    end
end