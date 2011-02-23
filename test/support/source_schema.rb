require 'active_record'

def legacy_connection
  unless @connection
    @connection                 = Itiel::DB::Connection.new
    @connection.sources_file    = File.dirname(__FILE__) + '/config/sources.yml'
    @connection.connection_name = "legacy"
  end

  @connection
end

ActiveRecord::Base.establish_connection legacy_connection.connection_string
ActiveRecord::Base.connection.instance_eval do
  create_table :orders, :force => true, :id => false do |t|
    t.integer :order_id
    t.float   :name
  end
end
