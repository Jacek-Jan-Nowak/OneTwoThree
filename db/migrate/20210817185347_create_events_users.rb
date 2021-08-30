class CreateEventsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :events_users do |t|
      t.references :event, null: false, foreign_key: true
      t.references :invite, null: false, foreign_key: true
      t.boolean :is_confirmed?
      t.references :dancer, index: true, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
