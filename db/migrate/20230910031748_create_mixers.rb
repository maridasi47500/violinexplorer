class CreateMixers < ActiveRecord::Migration[6.0]
  def change
    #drop_table :mixers
    create_table :mixers do |t|
      t.boolean :ctrf_room_out_l
      t.boolean :ctrl_room_out_r
      t.boolean :_2tr_out_r
      t.boolean :_2tr_out_l
      t.boolean :_2tr_in_r
      t.boolean :_2tr_in_l
      t.boolean :main_out_l
      t.boolean :main_out_r
      t.boolean :phones
      t.boolean :fx_send
      t.boolean :phantom
      t.float :fx_send_value
      t.boolean :_2tr_to_ctrl_room
      t.boolean :_2tr_to_mix
      t.boolean :fx_to_ctrl_room
      t.float :phones_value
      t.float :main_mix_value
      t.boolean :song_id

      t.timestamps
    end
  end
end
