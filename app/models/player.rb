class Player < ApplicationRecord
    has many :notes
    has_many :gamemasters, through: :notes
end
