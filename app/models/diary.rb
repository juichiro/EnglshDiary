class Diary < ApplicationRecord
    belongs_to :user
    validates :day, presence: true
    validates :title, presence: true ,length: { maximum: 30 }
    validates :description, presence: true 
    has_one_attached :image
end
