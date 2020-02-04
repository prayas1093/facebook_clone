class ChangeDefaultValueOfAddress < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :address, :string, :null => true
  end
end
