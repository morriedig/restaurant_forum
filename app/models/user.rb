class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, PhotoUploader


  has_many :comments
  has_many :restaurants, through: :comments

  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant
  
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships
  has_many :inverse_followships, class_name: "Followship", foreign_key: "following_id"
  has_many :followers, through: :inverse_followships, source: :user

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :reverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :reverse_friends, through: :reverse_friendships, source: :user


  def admin?
    self.role == "admin"
  end
    
  def like?(restaurant)
    self.liked_restaurants.include?(restaurant)
  end

  def favorite?(restaurant)
    self.favorited_restaurants.include?(restaurant)
  end

  def following?(user)
    self.followings.include?(user)
  end

  def all_friends
    (friends + reverse_friends).uniq
  end

  def friend?(user)
    if user.friends.include?(self)
      user.friends.include?(self)
    else
      self.friends.include?(user)
    end
  end

  def add?(user)
    self.friends.include?(user)
  end

  def added?(user)
    user.friends.include?(self)
  end

  def comfirm?(user)
    self.friendships.where(friend_id: user).first.comfirm  
  end
end
