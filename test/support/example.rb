module Legacy
  class Orders < Itiel::Extractor::DatabaseTable; end
end

module Destination
  class ShippedOrders < Itiel::Loaders::DatabaseTable; end
end
