class AddGroupToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :chatrooms, foreign_key: true
  end
end
