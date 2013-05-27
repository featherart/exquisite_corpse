class Corpse < ActiveRecord::Base
  attr_accessible :head_id, :legs_id, :name, :torso_id
end
