class AddReceiverToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :receiver, index: true, foreign_key: { to_table: :users }
  end
end
