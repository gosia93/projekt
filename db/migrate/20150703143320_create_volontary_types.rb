class CreateVolontaryTypes < ActiveRecord::Migration
  def change
    create_table :volontary_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
