class RenameCtrfRoomOutLToCtrlRoomOutLInmixers < ActiveRecord::Migration[6.0]
  def change
    rename_column(:mixers, :ctrf_room_out_l, :ctrl_room_out_l)
  end
end
