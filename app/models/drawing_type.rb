class DrawingType < ActiveRecord::Base
  attr_accessible :type_description
  has_many :drawings
end
