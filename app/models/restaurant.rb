class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader 
  belongs_to :category

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
  end

end
