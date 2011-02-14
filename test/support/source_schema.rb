Legacy::Order.connection.instance_eval do
	create_table :orders, :force => true, :id => false do |t|
		t.integer :order_id
	end
end
