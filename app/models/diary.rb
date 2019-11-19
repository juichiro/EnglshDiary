class Diary < ApplicationRecord
    belongs_to :user
    validates :day, presence: true
    validates :title, presence: true ,length: { maximum: 30 }
    validates :description, presence: true 
end
