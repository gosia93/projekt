class RemoveRoleableTypeFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :roleable_type, :string
  end
end
