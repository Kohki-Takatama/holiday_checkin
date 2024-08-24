class Post < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }

  has_many :likes, dependent: :destroy

  belongs_to :user

  def like_count
    likes.count
  end
end
