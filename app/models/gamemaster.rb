class Gamemaster < ApplicationRecord
    belongs_to :user
    has_many :notes
    has_many :players, through: :notes
end
