#Itiel::DataTable.expects(:sources_file_path).returns("#{File.dirname(__FILE__)}/config/sources.yml")

module Legacy
  class Order < Itiel::DataTable
    data_source :legacy
  end
end

module NewHome
  class Order < Itiel::DataTable
  end
end

class TransformProducts < Itiel::Transformation
  def transform!
    @orders = Legacy::Order.all

    #transform @orders => NewHome::Order do
      #map "order_id" => "id"
    #end
  end
end

