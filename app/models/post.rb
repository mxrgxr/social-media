class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, length: { in: 5..40 }, presence: true
  validates :body, length: { in: 10..100 }, presence: true
end
