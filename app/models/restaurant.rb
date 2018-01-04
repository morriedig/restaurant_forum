class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader 
  belongs_to :category
  has_many :comments

  # this two method have same effect
  scope :named, -> (search){ where("name LIKE ?", "%#{search}%")}
  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
