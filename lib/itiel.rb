require 'active_support/core_ext'

require 'itiel/job'
require 'itiel/logger'

module Itiel
  autoload :InputOutputDefinitions  , 'itiel/input_output_definitions'
  autoload :Nameable                , 'itiel/nameable'

  module DB
    autoload :Connection            , 'itiel/db/connection'
    autoload :SQLConnectable        , 'itiel/db/sql_connectable.rb'
  end

  module Extractor
    autoload :CSVFile               , 'itiel/extractor/csv_file'
    autoload :ChainedOutputBehavior , 'itiel/extractor/chained_output_behavior'
    autoload :ChainedStep           , 'itiel/extractor/chained_step'
    autoload :CustomSQL             , 'itiel/extractor/custom_sql'
    autoload :DatabaseConnection    , 'itiel/extractor/database_connection'
    autoload :DatabaseTable         , 'itiel/extractor/database_table'
    autoload :InputOutputBehavior   , 'itiel/extractor/input_output_behavior'
  end

  module Loader
    autoload :CSVFile               , 'itiel/loader/csv_file'
    autoload :ChainedStep           , 'itiel/loader/chained_step'
    autoload :DatabaseTable         , 'itiel/loader/database_table'
  end

  module Scripting
    autoload :ChainedStep           , 'itiel/scripting/chained_step'
    autoload :InputOutputBehavior   , 'itiel/scripting/input_output_behavior'
    autoload :SQLScript             , 'itiel/scripting/sql_script'
  end

  module Transformation
    autoload :CalculatedColumn      , 'itiel/transformation/calculated_column'
    autoload :ChainedStep           , 'itiel/transformation/chained_step'
    autoload :ConstantColumn        , 'itiel/transformation/constant_column'
    autoload :RenameColumn          , 'itiel/transformation/rename_column'
    autoload :SelectColumn          , 'itiel/transformation/select_column'
    autoload :InputOutputBehavior   , 'itiel/transformation/input_output_behavior'
    autoload :MapValues             , 'itiel/transformation/map_values'
  end
end
