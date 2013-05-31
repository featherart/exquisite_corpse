class DrawingType < ActiveRecord::Base
  attr_accessible :type_description, :type_id
  belongs_to :drawings
end
