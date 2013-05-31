class CreateDrawingTypes < ActiveRecord::Migration
  def change
    create_table :drawing_types do |t|
      t.string :type_description
      t.integer :type_id

      t.timestamps
    end
  end
end
