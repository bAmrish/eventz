class AddFieldsToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :description, :text
    add_column :events, :starts_at, :date
  end
end
