class Pair < ActiveRecord::Base
  attr_accessible :image_bottom, :image_top, :drawing
  has_many :drawings
  belongs_to :corpse
end
