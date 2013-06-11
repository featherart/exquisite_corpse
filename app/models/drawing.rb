class Drawing < ActiveRecord::Base
  attr_accessible :image, :type_id
  has_many :drawing_types
  belongs_to :pair
  #accepts_nested_attributes_for :pairs
end
