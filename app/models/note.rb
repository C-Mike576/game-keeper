class Note < ApplicationRecord

    validates :title, :content, presence: true

    belongs_to :gamemaster
    belongs_to :player
end
