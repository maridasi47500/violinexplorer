class AddAccompanimentIdToMyfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :myfiles, :accompaniment_id, :integer
    add_column :myfiles, :partonly, :boolean
  end
end
