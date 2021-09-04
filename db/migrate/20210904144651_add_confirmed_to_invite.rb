class AddConfirmedToInvite < ActiveRecord::Migration[6.0]
  def change
    add_column :invites, :confirmed?, :boolean, default: false
  end
end
