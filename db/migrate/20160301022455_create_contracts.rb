class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :contract
      t.boolean :status
      
      t.timestamps null: false
    end
  end
end
