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

  has_many :entries, dependent: :destroy
 has_many :messages, dependent: :destroy

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

  def self.guest
    User.find_or_create_by!(name_family:'guestuser', name_first:'太郎', email:'xxx@webcamp.jp', handle_name:'タロー', birth_year:'2022', birth_month:'12', birth_day:'12', age:'20') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name_family = "guestuser"
    end
  end



  # def get_profile_image
  #   unless profile_image.attached?
  #     file_path = Rails.root.join('app/assets/image/no_image.jpg')
  #     profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #     profile_image.variant(resize_to_limit: [width, height]).processed
  # end
end
