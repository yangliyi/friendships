class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendships do |t|
      t.integer :inviter_id
      t.integer :accepter_id
      t.string :status

      t.timestamps
    end
  end
end
