class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

# 一覧画面で使う
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  has_many :lists
  has_many :likes, dependent: :destroy
  has_one_attached :profile_image

  def full_name
    self.name_family + " " + self.name_first
  end

  def follow(user_id)
   follower.create(followed_id: user_id)
  end
  # ユーザーのフォローを外す
  def unfollow(user_id)
   follower.find_by(followed_id: user_id).destroy
  end
  # フォロー確認をおこなう
  def following?(user)
   following_user.include?(user)
  end


  # def get_profile_image
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/image/no_image.jpg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #     profile_image.variant(resize_to_limit: [width, height]).processed
  # end
end
