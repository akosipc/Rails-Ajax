class Album < ActiveRecord::Base
  attr_accessible :name, :artist_id
  belongs_to :artist

  validates :name, :presence => true,
  								 :length => 2..50
end
