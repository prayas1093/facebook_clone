class AddAcountPrivacyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :account_privacy, :boolean
    add_column :users, :profile_picture, :string
  end
end
