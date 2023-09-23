class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.integer :song_id
      t.text :content
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
