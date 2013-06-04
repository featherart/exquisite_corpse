class Pair < ActiveRecord::Base
  attr_accessible :image_bottom, :image_top
  belongs_to :drawings
end
