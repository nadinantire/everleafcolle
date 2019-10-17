class AddRoleToUsrs < ActiveRecord::Migration[5.2]
  def change
    change_column_default :usrs, :role, 'user'
  end
end
