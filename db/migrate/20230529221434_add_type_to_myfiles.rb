class AddTypeToMyfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :myfiles, :type, :string
  end
end
