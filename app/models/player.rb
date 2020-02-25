class Player < ApplicationRecord

    validates :name, presence: true
    validates :name, uniqueness: true

    belongs_to :user
    has_many :notes
    has_many :gamemasters, through: :notes

    
    scope :order_by_name, -> {
        order(arel_table['name'].lower.asc)
      }
end
