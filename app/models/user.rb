class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, PhotoUploader


  has_many :comments
  has_many :restaurants
  has_many :favorites, dependent: :destroy
  has_many :favorited_restaurants, through: :favorites, source: :restaurant
  has_many :likes, dependent: :destroy
  has_many :liked_restaurants, through: :likes, source: :restaurant
  has_many :followships, dependent: :destroy
  has_many :followings, through: :followships


  def admin?
    self.role == "admin"
  end
    
  def like?(restaurant)
    self.liked_restaurants.include?(restaurant)
  end

  def favorite?(restaurant)
    self.favorited_restaurants.include?(restaurant)
  end

end
