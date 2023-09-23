class ChangeSongIdFromMixersToInteger < ActiveRecord::Migration[6.0]
  def change
     change_column :mixers, :song_id, :integer
  end
end
