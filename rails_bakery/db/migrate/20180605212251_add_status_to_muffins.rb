class AddStatusToMuffins < ActiveRecord::Migration[5.2]
  def change
    add_column :muffins, :status, :integer, default: 1
  end
end
