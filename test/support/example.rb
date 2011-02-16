module Legacy
  class Orders < Itiel::Extractors::DatabaseTable; end
end

module Destination
  class ShippedOrders < Itiel::Loaders::DatabaseTable; end
end
