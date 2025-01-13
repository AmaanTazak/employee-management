class AddRoleToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :role, :string, default: 'employee' # Default to 'employee'
  end
end
