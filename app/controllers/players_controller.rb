class PlayersController < ApplicationController
    before_action :require_login
    before_action :find_player
    skip_before_action :find_player, only: [:new, :create]

    def new
        @player = Player.new
    end

    def create 
        @player = Player.new(params.require(:player).permit(:name))
        @player.user_id = current_user.id
        if @player.save
            redirect_to player_path(@player)
        else
            render :new
        end
    end

    def show 
        if @player.user_id != session[:user_id]
            redirect_to player_notes_path(@player)
        end
    end

    def edit 
    end

    def update
        @player.update(params.require(:player).permit(:name))
        if @player.valid?
            redirect_to player_path(@player)
        else
            render :edit
        end
    end

    private

    def find_player
        @player = Player.find_by_id(params[:id]) 
        if @player == nil
            redirect_to user_path(current_user)
        end
    end
end
