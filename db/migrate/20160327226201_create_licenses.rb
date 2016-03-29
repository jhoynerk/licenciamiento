class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.belongs_to :type_license, index: true, foreign_key: true
      t.belongs_to :contract, index: true, foreign_key: true
      t.string :serial
      t.date :creation_date
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
