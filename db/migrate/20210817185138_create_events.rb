class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :place, null: false, foreign_key: true
      t.references :user, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
