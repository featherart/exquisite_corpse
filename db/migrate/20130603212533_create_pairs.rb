class CreatePairs < ActiveRecord::Migration
  def change
    create_table :pairs do |t|
      t.integer :image_top
      t.integer :image_bottom

      t.timestamps
    end
  end
end
