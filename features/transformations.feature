Feature: Transformations

  Background:
    Given a "source.csv" file with the following rows:
      | id | name  | state    |
      | 1  | john  | active   |
      | 2  | ruby  | active   |
      | 3  | rails | inactive |
      | 4  | pete  | active   |

    # @source = Itiel::Extractors::CSVFile.new('source.csv')
    And I create a Extractor::CSVFile object with "source.csv"
    # @destination  = Itiel::Loaders::CSVFile.new('destination.csv')
    And I create a Loader::CSVFile object with "destination.csv"


  Scenario: Append a constant value column to the original stream
    # @contsant_field = Itiel::Transformation::ConstantField.new("constant" => "value")
    Given I create a Transformation::ConstantField object with "constant" => "value"

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

  Scenario: Map Values in a column
    # @map_values = Itiel::Transformation::MapValues.new("state" => { "active" => 1, "inactive" => 0 })
    Given I create a Transformation::MapValues object for the state column to integer

    # @source.next_step     = @map_values
    # @map_values.next_step = @destination
    And the data flows in the following direction:
      | @source      |
      | @map_values  |
      | @destination |

    # @source.start
    When I start the source

    Then the "destination.csv" file should exist with the following content:
      | id | name  | state |
      | 1  | john  | 1     |
      | 2  | ruby  | 1     |
      | 3  | rails | 0     |
      | 4  | pete  | 1     |


  Scenario: Rename an existing column
    # @rename_column = Itiel::Transformation::RenameColumn.new("state" => "status")
    Given I create a Transformation::RenameColumn object from "state" to "status"

    # @source.next_step     = @rename_column
    # @rename_column.next_step = @destination
    And the data flows in the following direction:
      | @source        |
      | @rename_column |
      | @destination   |

    # @source.start
    When I start the source

    Then the "destination.csv" file should exist with the following content:
      | id | name  | status   |
      | 1  | john  | active   |
      | 2  | ruby  | active   |
      | 3  | rails | inactive |
      | 4  | pete  | active   |

  Scenario: Select specific columns from the stream
    # @select_column = Itiel::Transformation::SelectColumn.new("id", "state")
    Given I create a Transformation::SelectColumn object with "id" and "state"

    # @source.next_step     = @select_column
    # @select_column.next_step = @destination
    And the data flows in the following direction:
      | @source        |
      | @select_column |
      | @destination   |

    # @source.start
    When I start the source

    Then the "destination.csv" file should exist with the following content:
      | id | state    |
      | 1  | active   |
      | 2  | active   |
      | 3  | inactive |
      | 4  | active   |

