class CreateSearchOrganisations < ActiveRecord::Migration
  def change
    create_table :search_organisations do |t|
      t.string :city
      t.integer :volontary_type_id

      t.timestamps null: false
    end
  end
end
