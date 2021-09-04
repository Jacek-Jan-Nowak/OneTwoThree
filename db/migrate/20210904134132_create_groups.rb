class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :event, null: false, index: true, foreign_key: true
      t.references :owner, index: true, foreign_key: { to_table: :users }
    end
  end
end
