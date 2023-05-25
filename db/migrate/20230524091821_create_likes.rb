class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :facebook_user, null: false, foreign_key: true
      t.references :fb_post, null: false, foreign_key: true
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
