class Player < ApplicationRecord
    belongs_to :user
    has_many :notes
    has_many :gamemasters, through: :notes
end
