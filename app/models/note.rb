class Note < ApplicationRecord
    belongs_to :gamemaster
    belongs_to :player
end
