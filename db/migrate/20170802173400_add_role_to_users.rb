class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integers
  end
end