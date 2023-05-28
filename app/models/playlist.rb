class Playlist < ApplicationRecord
has_and_belongs_to_many :pieces, join_table: :playlistpieces
accepts_nested_attributes_for :pieces
end
