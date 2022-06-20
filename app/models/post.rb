class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :title, :body, presence: true
  scope :sort_posts_by_asc, -> { order(title: :asc) }
  scope :sort_posts_by_old, -> { order(created_at: :desc) }

  def self.sort_by_comments
    rows = Post.all
    sorted_posts = Hash.new { |k, h|  h[k] = nil}
    for i in rows
      sorted_posts[i] = i.comments.count
    end
    sorted_posts = sorted_posts.sort { |a, b| b[1] <=> a[1] }.to_h
    sorted_posts.keys.each_with_object({}) { |k, h| h[k] = sorted_posts[k] }
    sorted_posts.keys
  end
end
