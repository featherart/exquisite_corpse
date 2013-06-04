class Drawing < ActiveRecord::Base
  attr_accessible :image, :type_id
  has_many :drawing_types
  has_many :pairs
end
