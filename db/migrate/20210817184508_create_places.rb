class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.references :owner, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
