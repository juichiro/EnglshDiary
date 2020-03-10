class WordBook < ApplicationRecord
    belongs_to :user
    validates :eword, presence: true,length: { maximum: 30 }
    validates :jword, presence: true,length: { maximum: 30 }
end
