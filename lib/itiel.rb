require 'active_support/core_ext'

require 'itiel/job'
require 'itiel/logger'

module Itiel
  autoload :InputOutputDefinitions  , 'itiel/input_output_definitions'
  autoload :Nameable                , 'itiel/nameable'

  module DB
    autoload :Connection            , 'itiel/DB/connection'
  end

  module Extractors
    autoload :CSVFile               , 'itiel/extractors/csv_file'
    autoload :ChainedOutputBehavior , 'itiel/extractors/chained_output_behavior'
    autoload :DatabaseConnection    , 'itiel/extractors/database_connection'
    autoload :DatabaseTable         , 'itiel/extractors/database_table'
    autoload :InputOutputBehavior   , 'itiel/extractors/input_output_behavior'
  end

  module Loaders
    autoload :CSVFile               , 'itiel/loaders/csv_file'
    autoload :DatabaseTable         , 'itiel/loaders/database_table'
    autoload :InputOutputBehavior   , 'itiel/loaders/input_output_behavior'
  end

  module Scripting
    autoload :InputOutputBehavior   , 'itiel/scripting/input_output_behavior'
    autoload :SQLScript             , 'itiel/scripting/sql_script'
  end

  module Transformations
    autoload :CalculatedField       , 'itiel/transformations/calculated_field'
    autoload :ChainedStep           , 'itiel/transformations/chained_step'
    autoload :ConstantField         , 'itiel/transformations/constant_field'
    autoload :FieldRename           , 'itiel/transformations/field_rename'
    autoload :FieldSelect           , 'itiel/transformations/field_select'
    autoload :InputOutputBehavior   , 'itiel/transformations/input_output_behavior'
		autoload :MapValues             , 'itiel/transformations/map_values'
    autoload :SingleColumnSort      , 'itiel/transformations/single_column_sort'
  end
end
