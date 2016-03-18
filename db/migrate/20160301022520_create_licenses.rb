class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.belongs_to :type_licenses
      t.belongs_to :contract
      t.string :serial
      t.date :creation_date
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
