class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.integer :regon
      t.string :city
      t.text :about
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
