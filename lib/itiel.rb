require 'active_support/core_ext'

require 'itiel/job'
require 'itiel/logger'

module Itiel
  autoload :InputOutputDefinitions , 'itiel/input_output_definitions'
  autoload :Nameable               , 'itiel/nameable'
  autoload :Loaders                , 'itiel/loaders'
  autoload :Extractors             , 'itiel/extractors'
  autoload :Transformations        , 'itiel/transformations'
end
