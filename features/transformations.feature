Feature: Transformations

  Scenario: Append a constant value column to the original stream
    Given a "source.csv" file with the following rows:
      | id | name  | state    |
      | 1  | john  | active   |
      | 2  | ruby  | active   |
      | 3  | rails | inactive |
      | 4  | pete  | active   |

    # @source = Itiel::Extractors::CSVFile.new('source.csv')
    When I create a Extractor::CSVFile object with "source.csv"
    # @destination  = Itiel::Loaders::CSVFile.new('destination.csv')
    And I create a Loader::CSVFile object with "destination.csv"
    # @contsant_field = Itiel::Transformation::ConstantField.new("constant" => "value")
    And I create a Transformation::ConstantField object with "constant" => "value"

    # @source.next_step         = @constant_field
    # @contsant_field.next_step = @destination
    And the data flows in the following direction:
      | @source         |
      | @constant_field |
      | @destination    |

    # @source.start
    When I start the source

    Then the "destination.csv" file should exist with the following content:
      | id | name  | state    | constant |
      | 1  | john  | active   | value    |
      | 2  | ruby  | active   | value    |
      | 3  | rails | inactive | value    |
      | 4  | pete  | active   | value    |
