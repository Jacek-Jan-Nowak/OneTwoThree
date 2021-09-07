class AddGroupToMessages < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :messages, foreign_key: true
  end
end
