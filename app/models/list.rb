class List < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :likes, dependent: :destroy


  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true


  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

end
