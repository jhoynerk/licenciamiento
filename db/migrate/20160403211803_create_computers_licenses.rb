class CreateComputersLicenses < ActiveRecord::Migration
  def change
    create_table :computers_licenses do |t|
      t.belongs_to :license
      t.string :ip
      t.string :mac_address
      t.boolean :status, default: true, null: false
    end
  end
end
