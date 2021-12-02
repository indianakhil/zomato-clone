class AddUserRoleToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_role, :string, default: "customer"
  end
end
