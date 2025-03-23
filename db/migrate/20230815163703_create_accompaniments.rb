class CreateAccompaniments < ActiveRecord::Migration[6.0]
  def change
    create_table :accompaniments do |t|
      t.integer :song_id
      t.string :filename

      t.timestamps
    end
  end
end
