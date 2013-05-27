class UnlimitedImageSize < ActiveRecord::Migration
  def change
    change_table :drawings do |t|
        t.change :image, :text, :limit => nil
    end
  end
end
