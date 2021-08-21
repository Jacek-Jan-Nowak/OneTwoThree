class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events do |t|
      t.references :dancer, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.references :invite, null: false, foreign_key: true
      t.boolean :is_confirmed?
      t.timestamps
    end
    add_foreign_key :user_events, :users, column: :dancer_id, primary_key: :id

  end
end
