class ChangeStartsAtForEvents < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :starts_at, :datetime
  end
end
