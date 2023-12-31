class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy
  validates :body, length: { in: 5..50 }, presence: true
  scope :top_level, -> { where(parent_id: nil) }
end
