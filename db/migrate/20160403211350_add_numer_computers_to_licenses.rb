class AddNumerComputersToLicenses < ActiveRecord::Migration
  def change
    add_column :licenses, :number_computers, :integer
  end
end
