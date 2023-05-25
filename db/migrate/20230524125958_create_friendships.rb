class CreateFriendships < ActiveRecord::Migration[6.1]
  def change
    create_table :friendships do |t|
      t.references :facebook_user, null: false, foreign_key: true
      t.string :status
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
  end
end
