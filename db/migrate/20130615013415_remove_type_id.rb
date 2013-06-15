class RemoveTypeId < ActiveRecord::Migration
  def up
  	rename_column :drawings, :type_id, :drawing_type_id
  end

  def down
  	remove_column :drawing_types, :type_id
  end
end


