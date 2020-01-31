class AddSlugToPost < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t| 
      t.string :slug, after: :id
    end  
    add_index :posts, :slug, unique: true
  end
end
