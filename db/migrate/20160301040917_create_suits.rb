class CreateSuits < ActiveRecord::Migration
  def change
    create_table :suits do |t|
      t.belongs_to :customer
      t.belongs_to :license
      t.belongs_to :product
      t.timestamps null: false
    end
  end
end
