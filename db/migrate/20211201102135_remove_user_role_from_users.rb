class RemoveUserRoleFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_role, :string
  end
end
