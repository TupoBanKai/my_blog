class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, :body, presence: true
  scope :posts_with_title, -> (title) { where('title = ?', title) }
end
