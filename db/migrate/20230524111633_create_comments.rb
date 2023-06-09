class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.references :facebook_user, null: false, foreign_key: true
      t.references :fb_post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
