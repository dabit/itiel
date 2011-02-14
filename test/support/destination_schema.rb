NewHome::Order.connection.instance_eval do
	create_table :orders, :force => true do |t|
		t.integer :id
	end
end
