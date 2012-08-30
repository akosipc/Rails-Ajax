class Album < ActiveRecord::Base
  attr_accessible :name, :artist_id
  belongs_to :artist
end
