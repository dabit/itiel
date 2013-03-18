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

  module Extract
    autoload :CSVFile               , 'itiel/extract/csv_file'
    autoload :ChainedOutputBehavior , 'itiel/extract/chained_output_behavior'
    autoload :ChainedStep           , 'itiel/extract/chained_step'
    autoload :CustomSQL             , 'itiel/extract/custom_sql'
    autoload :DatabaseConnection    , 'itiel/extract/database_connection'
    autoload :DatabaseTable         , 'itiel/extract/database_table'
    autoload :InputOutputBehavior   , 'itiel/extract/input_output_behavior'
  end

  module Load
    autoload :CSVFile               , 'itiel/load/csv_file'
    autoload :ChainedStep           , 'itiel/load/chained_step'
    autoload :DatabaseTable         , 'itiel/load/database_table'
  end

  module Lookup
    autoload :DatabaseTable         , 'itiel/lookup/database_table'
    autoload :ChainedStep           , 'itiel/lookup/chained_step'
  end

  module Script
    autoload :ChainedStep           , 'itiel/script/chained_step'
    autoload :InputOutputBehavior   , 'itiel/script/input_output_behavior'
    autoload :SQLScript             , 'itiel/script/sql_script'
    autoload :RubyScript            , 'itiel/script/ruby_script'
  end

  module Transform
    autoload :CalculatedColumn      , 'itiel/transform/calculated_column'
    autoload :ChainedStep           , 'itiel/transform/chained_step'
    autoload :ConstantColumn        , 'itiel/transform/constant_column'
    autoload :RenameColumn          , 'itiel/transform/rename_column'
    autoload :SelectColumn          , 'itiel/transform/select_column'
    autoload :InputOutputBehavior   , 'itiel/transform/input_output_behavior'
    autoload :MapValues             , 'itiel/transform/map_values'
  end
end
