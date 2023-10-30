class AddNameToMixers < ActiveRecord::Migration[6.0]
  def change
    add_column :mixers, :name, :string
  end
end
