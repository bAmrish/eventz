class RemoveImageFileNameFromEvent < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :image_file_name, :string
  end
end
