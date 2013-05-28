class ChangeTypePostgres < ActiveRecord::Migration
  def up
    connection.execute(%q{
        ALTER TABLE drawings
        DROP COLUMN type,
        ADD COLUMN type_id integer
    })
  end
end