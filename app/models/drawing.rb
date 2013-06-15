class Drawing < ActiveRecord::Base
  attr_accessible :image, :drawing_type_id
  #delegate :type_description, :to => :drawing_type
  belongs_to :drawing_type #, :select => 'drawings.*, drawing_types.type_description as type_description'
  belongs_to :pair
  #accepts_nested_attributes_for :pairs
end
