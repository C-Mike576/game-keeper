class Gamemaster < ApplicationRecord
    belongs_to :user
    has many :notes
    has_many :players, through: :notes
end
