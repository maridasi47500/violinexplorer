class AddMyContentToMyfiles < ActiveRecord::Migration[6.0]
  def change
    add_column :myfiles, :mycontent, :text
  end
end
