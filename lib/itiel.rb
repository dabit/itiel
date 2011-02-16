require 'active_support/core_ext'

require 'itiel/job'

module Itiel
  autoload :InputOutputDefinitions , 'itiel/input_output_definitions'
  autoload :Nameable               , 'itiel/nameable'
  autoload :Outputs                , 'itiel/outputs'
  autoload :Extractors             , 'itiel/extractors'
  autoload :Transformations        , 'itiel/transformations'
end
