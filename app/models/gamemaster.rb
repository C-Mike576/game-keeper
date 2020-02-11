class Gamemaster < ApplicationRecord
    has many :notes
    has_many :players, through: :notes
end
