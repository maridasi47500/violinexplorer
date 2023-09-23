class CreateMics < ActiveRecord::Migration[6.0]
  def change
    create_table :mics do |t|
      t.boolean :mic
      t.boolean :line_in
      t.float :gain
      t.float :eq_high
      t.float :eq_mid
      t.float :eq_low
      t.boolean :low_cut
      t.float :fx
      t.float :ban
      t.float :level
      t.integer :mixer_id
      t.string :type

      t.timestamps
    end
  end
end
