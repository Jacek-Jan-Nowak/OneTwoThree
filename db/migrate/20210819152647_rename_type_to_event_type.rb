class RenameTypeToEventType < ActiveRecord::Migration[6.0]
  def change
    rename_column :events, :type, :event_type
  end
end
