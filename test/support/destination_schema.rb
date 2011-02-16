require 'active_record'

def destination_connection
  unless @destination_connection
    @destination_connection                 = Itiel::Extractors::DatabaseConnection.new
    @destination_connection.sources_file    = File.dirname(__FILE__) + '/config/sources.yml'
    @destination_connection.connection_name = "destination"
  end

  @destination_connection
end

ActiveRecord::Base.establish_connection destination_connection.connection_string
ActiveRecord::Base.connection.instance_eval do
  create_table :shipped_orders, :force => true, :id => false do |t|
    t.integer :id
    t.string :name
  end
end
