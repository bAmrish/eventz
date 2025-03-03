class AddImageAndCapacityToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :image_file_name, :string, default: "placeholder"
    add_column :events, :capacity, :integer, default: 1
  end
end
