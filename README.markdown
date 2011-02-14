# Itiel

Hopefully, it will be an awesome DSL to do ETL with Ruby

This is sort of what I have in mind:

    module Legacy
      class Order < Itiel::DataTable
        data_source :legacy
      end
    end

    module NewHome
      class Order < Itiel::DataTable
        data_source :new_home
      end
    end

    class TransformOrders < Itiel::Transformation
      def transform!
        @orders = Legacy::Order.all

        result = update_or_create(@orders, NewHome::Order, "order_id" => "id") do
          map "order_id" => "id"
        end

        # Do something to persist results here
        result
      end
    end
