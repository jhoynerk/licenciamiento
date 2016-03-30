class AddContract < ActiveRecord::Migration
  def change
    add_column :contracts, :license_id, :integer
  end
end
