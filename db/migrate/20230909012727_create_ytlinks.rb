class CreateYtlinks < ActiveRecord::Migration[6.0]
  def change
    create_table :ytlinks do |t|
      t.string :link
      t.integer :song_id

      t.timestamps
    end
  end
end
