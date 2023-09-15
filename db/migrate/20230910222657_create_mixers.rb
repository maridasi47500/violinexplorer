class CreateMixers < ActiveRecord::Migration[6.0]
  def change
    create_table :mixers do |t|

      t.timestamps
    end
  end
end
