class CreateFbPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :fb_posts do |t|
      t.text :content
      t.references :facebook_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
