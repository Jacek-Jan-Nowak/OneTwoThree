class AddInviteeToInvites < ActiveRecord::Migration[6.0]
  def change
    add_reference :invites, :invitee, index: true, foreign_key: { to_table: :users }
  end
end
