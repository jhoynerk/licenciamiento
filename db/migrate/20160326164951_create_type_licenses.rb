class CreateTypeLicenses < ActiveRecord::Migration
  def change
    create_table :type_licenses do |t|
      t.string :name
      t.integer :duration
      t.string :version
      t.boolean :status
      t.timestamps null: false
    end
  end
end
