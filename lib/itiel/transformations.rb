module Itiel
  module Transformations
    autoload :CalculatedField       , 'itiel/transformations/calculated_field'
    autoload :ConstantField       , 'itiel/transformations/constant_field'
    autoload :FieldRename         , 'itiel/transformations/field_rename'
    autoload :FieldSelect         , 'itiel/transformations/field_select'
    autoload :InputOutputBehavior , 'itiel/transformations/input_output_behavior.rb'
    autoload :SingleColumnSort    , 'itiel/transformations/single_column_sort.rb'
  end
end
