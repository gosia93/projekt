class CreateVolonteers < ActiveRecord::Migration
  def change
    create_table :volonteers do |t|
      t.string :name
      t.string :surname
      t.integer :age
      t.string :city
      t.text :about
      t.integer :user_id
      t.integer :volontary_type_id

      t.timestamps null: false
    end
  end
end
