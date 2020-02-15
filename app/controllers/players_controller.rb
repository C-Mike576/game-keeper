class PlayersController < ApplicationController

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
        @player = Player.find_by_id(params[:id])
    end


end
