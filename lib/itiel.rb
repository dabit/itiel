require 'yaml'

require 'active_support'
require 'active_support/core_ext'

require 'itiel/job'
require 'itiel/logger'

module Itiel
  autoload :InputOutputDefinitions  , 'itiel/input_output_definitions'
  autoload :Nameable                , 'itiel/nameable'

  module DB
    autoload :Connection            , 'itiel/db/connection'
    autoload :SQLConnectable        , 'itiel/db/sql_connectable.rb'
    autoload :Truncator             , 'itiel/db/truncator.rb'
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
    autoload :CSVFile               , 'itiel/lookup/csv_file'
    autoload :ChainedStep           , 'itiel/lookup/chained_step'
    autoload :HashLookup            , 'itiel/lookup/hash_lookup'
  end

  module Script
    autoload :ChainedStep           , 'itiel/script/chained_step'
    autoload :InputOutputBehavior   , 'itiel/script/input_output_behavior'
    autoload :SQLScript             , 'itiel/script/sql_script'
    autoload :RubyScript            , 'itiel/script/ruby_script'
  end

  module Transform
    autoload :CalculatedColumns     , 'itiel/transform/calculated_columns'
    autoload :ChainedStep           , 'itiel/transform/chained_step'
    autoload :ConstantColumn        , 'itiel/transform/constant_column'
    autoload :RenameColumn          , 'itiel/transform/rename_column'
    autoload :RemoveColumn          , 'itiel/transform/remove_column'
    autoload :SelectColumn          , 'itiel/transform/select_column'
    autoload :InputOutputBehavior   , 'itiel/transform/input_output_behavior'
    autoload :MapValues             , 'itiel/transform/map_values'
  end

  class MethodNotImplementedException < Exception; end
  class MissingConnection < Exception ; end
  class UndefinedNextStepException < Exception ; end
  class SQLSentenceNotProvided < Exception ; end
end
