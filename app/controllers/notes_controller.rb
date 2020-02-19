class NotesController < ApplicationController
    before_action :require_login
    before_action :find_note
    skip_before_action :require_login, only: [:index]
    skip_before_action :find_note, only: [:index, :new, :create]
    
    def index
        if params[:gamemaster_id] && @gamemaster = 
            Gamemaster.find_by_id(params[:gamemaster_id])
            @notes = @gamemaster.notes
        elsif params[:player_id] && @player = 
            Player.find_by_id(params[:player_id])
            @notes = @player.notes
        else
            @notes = Note.all 
        end
    end

    def show
    end

    def new
        if params[:gamemaster_id] && @gamemaster = 
            current_user.gamemasters.find_by_id(params[:gamemaster_id])
        @note = Note.new(gamemaster_id: params[:gamemaster_id])
        else
            redirect_to notes_path
        end
    end

    def create 
        @note = Note.new(note_params)
        if @note.save
            redirect_to note_path(@note)
        else
            render :new
        end
    end 

    def edit 
    end

    def update
        @note.update(params.require(:note).permit(:title, :content))
        if @note.valid?
            redirect_to note_path(@note)
        else
            render :edit
        end
    end

    def destroy
        @note.destroy
        redirect_to user_path(current_user)
    end


private

    def note_params
        params.require(:note).permit(:title, :content, :gamemaster_id, :player_id)
    end

    def find_note
        @note = Note.find_by_id(params[:id]) 
        if @note == nil
            redirect_to user_path(current_user)
        end

    end


end
