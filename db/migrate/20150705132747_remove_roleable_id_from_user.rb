class RemoveRoleableIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :roleable_id, :integer
  end
end
