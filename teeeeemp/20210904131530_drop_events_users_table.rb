class DropEventsUsersTable < ActiveRecord::Migration[6.0]

  def up
    drop_table :events_users
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
