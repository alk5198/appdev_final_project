class AddAddressToEvents < ActiveRecord::Migration
  def change
    add_column :events, :address, :string
    add_column :events, :lat, :decimal
    add_column :events, :long, :decimal
  end
end
