class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_type
      t.string :name
      t.datetime :start_time
      t.references :place, null: false, foreign_key: true
      t.references :host, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
