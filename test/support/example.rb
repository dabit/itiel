module Legacy
  class Orders < Itiel::Sources::DatabaseTable; end
end

module Destination
  class ShippedOrders < Itiel::Outputs::DatabaseTable; end
end
