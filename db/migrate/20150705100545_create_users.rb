class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.integer :roleable_id
      t.string :roleable_type

      t.timestamps null: false
    end
  end
end
