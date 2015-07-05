class AddVolontaryTypeIdToOrganisation < ActiveRecord::Migration
  def change
    add_column :organisations, :volontary_type_id, :integer
  end
end
