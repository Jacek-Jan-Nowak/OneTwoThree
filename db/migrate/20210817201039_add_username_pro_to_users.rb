class AddUsernameProToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :username, :string
    add_column :users, :is_pro?, :boolean, default: false
  end
end
