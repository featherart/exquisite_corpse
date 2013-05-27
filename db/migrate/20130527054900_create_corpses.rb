class CreateCorpses < ActiveRecord::Migration
  def change
    create_table :corpses do |t|
      t.string :name
      t.integer :head_id
      t.integer :torso_id
      t.integer :legs_id

      t.timestamps
    end
  end
end
