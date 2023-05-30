class CreateMyfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :myfiles do |t|
      t.string :filename
      t.integer :song_id

      t.timestamps
    end
  end
end
