class Corpse < ActiveRecord::Base
  #attr_accessible :head_id, :legs_id, :name, :torso_id
  #has_many :drawings
  has_many :pairs
end
