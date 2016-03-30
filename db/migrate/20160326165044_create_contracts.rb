class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :contract
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
