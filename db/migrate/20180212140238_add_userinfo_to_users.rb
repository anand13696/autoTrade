class AddUserinfoToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :name, :string
  	add_column :users, :username, :string
  	add_column :users, :contact, :string
  	add_column :users, :college, :string
  	add_column :users, :role, :integer
  end
end
