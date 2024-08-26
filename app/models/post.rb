class Post < ApplicationRecord
  validates :body, presence: true, length: { maximum: 140 }

  has_many :likes, dependent: :destroy

  belongs_to :user

  def like_count
    likes.count
  end

  def self.today_posts
    where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
  end
end
