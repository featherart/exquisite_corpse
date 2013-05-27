class ChangeDrawingType < ActiveRecord::Migration
  def change
  	remove_column :drawings, :type
  	add_column :drawings, :type_id, :integer
  end
end
