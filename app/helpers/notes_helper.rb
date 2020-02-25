module NotesHelper

    def display_nested_header
        if @gamemaster
            "#{@gamemaster.name}'s notes"
        elsif @player
            "#{@player.name}'s notes"
        else
            "All note titles"
        end
    end

end
