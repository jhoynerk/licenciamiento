class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :version
      t.boolean :status
      t.timestamps null: false
    end
  end
end
