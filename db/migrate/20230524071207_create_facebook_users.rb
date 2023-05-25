class CreateFacebookUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :facebook_users do |t|
      t.string :name
      t.integer :age
      t.text :interests
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
