class AddStyleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :style, :string
  end
end
