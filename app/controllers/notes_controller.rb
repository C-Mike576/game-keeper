class NotesController < ApplicationController
    before_action :require_login
    before_action :find_note
    before_action :find_gamemaster, only:[:new, :create]
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
        @note = @gamemaster.notes.build
    end

    def create
        @note = @gamemaster.notes.build(note_params)
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
        redirect_to gamemaster_path(current_user)
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

    def find_gamemaster
        @gamemaster = Gamemaster.find(params[:gamemaster_id])
    end


end
