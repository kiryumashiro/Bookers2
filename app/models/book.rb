class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, length: { minimum: 200, maximum: 10 }
end