class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  def self.search(keyword)
    if keyword.is_a?(String)
      where('body LIKE ?', keyword)
    end
  end
end
