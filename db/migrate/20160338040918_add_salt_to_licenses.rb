class AddSaltToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :salt, :string
  end
end
