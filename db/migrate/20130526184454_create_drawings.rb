class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end
