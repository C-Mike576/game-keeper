class Gamemaster < ApplicationRecord

    validates :name, presence: true
    validates :name, uniqueness: true

    belongs_to :user
    has_many :notes
    has_many :players, through: :notes
end
