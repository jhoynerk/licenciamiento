class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :business_name
      t.string :rif
      t.string :address
      t.string :phone
      t.string :email
      t.boolean :status

      t.timestamps null: false
    end
  end
end
