class AddNbToMics < ActiveRecord::Migration[6.0]
  def change
    add_column :mics, :nb, :integer
  end
end
