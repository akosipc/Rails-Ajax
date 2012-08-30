class Artist < ActiveRecord::Base
  attr_accessible :bio, :image, :name	
  has_many :albums

  validates :name, :bio, :presence => true
  validates :name, :length => 6..30
  validates :bio, :length => 5..500
end
