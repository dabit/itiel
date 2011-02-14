module Legacy
  class Order < Itiel::DataTable
    def self.sources_file_path
      File.dirname(__FILE__) + "/config/sources.yml"
    end

    data_source :legacy
  end
end

module NewHome
  class Order < Itiel::DataTable
    def self.sources_file_path
      File.dirname(__FILE__) + "/config/sources.yml"
    end

    data_source :new_home
  end
end

class TransformOrders < Itiel::Transformation
  def transform!
    @orders = Legacy::Order.all

    results = update_or_create(@orders, NewHome::Order, "order_id" => "id") do
      map "order_id" => "id"
    end

    # Persist the results objects
    results.each do |result|
      result.save!
    end
  end
end

