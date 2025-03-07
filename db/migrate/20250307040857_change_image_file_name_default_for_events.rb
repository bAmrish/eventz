class ChangeImageFileNameDefaultForEvents < ActiveRecord::Migration[7.1]
  def change
    change_column_default :events, :image_file_name, "placeholder.png"
  end
end
