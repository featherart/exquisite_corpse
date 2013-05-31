class Drawing < ActiveRecord::Base
  attr_accessible :image, :type_id
  has_many :drawing_types
end
