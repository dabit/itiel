class Legacy < Itiel::DataSource
end

module Legacy
  data_source :legacy

  class Order << Itiel::DataTable
    # order_id int
    # order_product_name string
    # order_price float
    # order_quantity
    # order_timestamp
  end
end

module NewHome
  data_source :new_home

  class Order << Itiel::DataTable
    # id
    # product_id
    # price
    # quantity
    # created_at
  end

  class Product << Itiel::DataTable
    # id
    # name
  end
end

class TransformProducts << Itiel::Transformation
  def transform!
    transform Legacy::Order => NewHome::Order do
      map "order_id" => "id"

      lookup_or_create "order_product_name", 
          :data_table => NewHome::Product,
          :where => {:name => "order_product_name"}
          :foreign_key => "product_id"

      map "order_price" => "price"
      map "order_itemstamp" => "created_at"
    end
  end
end

