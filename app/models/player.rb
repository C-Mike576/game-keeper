class Player < ApplicationRecord

    validates :name, presence: true
    validates :name, uniqueness: true

    belongs_to :user
    has_many :notes
    has_many :gamemasters, through: :notes
end
