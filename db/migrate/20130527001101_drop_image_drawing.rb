class DropImageDrawing < ActiveRecord::Migration
  def change
    change_table :drawings do |t|
        t.change :image, :text
    end
  end
end
