class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.integer :tempo
      t.integer :date
      t.string :title
      t.string :composer
      t.integer :length
      t.string :style

      t.timestamps
    end
  end
end
