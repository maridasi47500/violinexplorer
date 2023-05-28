class CreatePlaylists < ActiveRecord::Migration[6.0]
  def change
    create_table :playlists do |t|
      t.string :title

      t.timestamps
    end
    create_table :playlistpieces do |t|
      t.integer :playlist_id
      t.integer :piece_id

      t.timestamps
    end
  end
end
