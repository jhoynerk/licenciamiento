class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :business_name
      t.string :rif
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :status
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
