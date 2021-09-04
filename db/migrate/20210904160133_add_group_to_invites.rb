class AddGroupToInvites < ActiveRecord::Migration[6.0]
  def change
    add_reference :invites, :group, index: true
  end
end
