class ChangeTypeOfTypeInDrawings < ActiveRecord::Migration
  def change
    change_table :drawings do |t|
        t.change :type, :integer
    end
  end
end
