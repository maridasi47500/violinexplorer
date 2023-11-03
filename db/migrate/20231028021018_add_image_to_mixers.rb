class AddImageToMixers < ActiveRecord::Migration[6.0]
  def change
    add_column :mixers, :image, :string
  end
end
