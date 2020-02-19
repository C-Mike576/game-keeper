class NotesController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index]
    
    def index
        @notes = Note.all 
    end

    def show
        @note = Note.find_by_id(params[:id])
    end

    def new
        if params[:gamemaster_id] && @gamemaster = 
            Gamemaster.find_by_id(params[:gamemaster_id])
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
        @note = Note.find_by_id(params[:id])
    end

    def update
        @note = Note.find_by_id(params[:id])
        @note.update(params.require(:note).permit(:title, :content))
        if @note.valid?
            redirect_to note_path(@note)
        else
            render :edit
        end
    end

    def destroy
        @note = Note.find_by_id(params[:id])
        @note.destroy
        redirect_to user_path(current_user)
    end


private

    def note_params
        params.require(:note).permit(:title, :content, :gamemaster_id, :player_id)
    end

end
