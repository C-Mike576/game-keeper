class Player < ApplicationRecord
    belongs_to :user
    has many :notes
    has_many :gamemasters, through: :notes
end
