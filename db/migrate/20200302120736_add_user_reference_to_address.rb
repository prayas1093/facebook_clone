class AddUserReferenceToAddress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses,:user,index: true
  end
end
