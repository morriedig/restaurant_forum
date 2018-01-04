class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader 
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  # this two method have same effect
  scope :named, -> (search){ where("name LIKE ?", "%#{search}%")}
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
