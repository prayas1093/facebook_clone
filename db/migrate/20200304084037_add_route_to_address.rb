class AddRouteToAddress < ActiveRecord::Migration[6.0]
  def change
    add_column :addresses,:route,:string
  end
end
