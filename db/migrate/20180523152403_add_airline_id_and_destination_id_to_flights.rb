class AddAirlineIdAndDestinationIdToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :airline_id, :integer
    add_column :flights, :destination_id, :integer
  end
end
