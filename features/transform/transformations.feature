Feature: Transformations

  Background:
    Given a "source.csv" file with the following rows:
      | id | name  | state    |
      | 1  | john  | active   |
      | 2  | ruby  | active   |
      | 3  | rails | inactive |
      | 4  | pete  | active   |

    # @source = Itiel::Extracts::CSVFile.new('source.csv')
    And I create a Extractor::CSVFile object with "source.csv"
    # @destination  = Itiel::Loads::CSVFile.new('destination.csv')
    And I create a Loader::CSVFile object with "destination.csv"


  Scenario: Append a constant value column to the original stream
    # @constant_column = Itiel::Transform::ConstantColumn.new("constant" => "value")
    Given I create a Transformation::ConstantColumn object with "constant" => "value"

    # @source >> @constant_column >> @destination
    And the data flows in the following direction:
      | @source          |
      | @constant_column |
      | @destination     |

    # @source.start
    When I start the source

    Then the "destination.csv" file should exist with the following content:
      | id | name  | state    | constant |
      | 1  | john  | active   | value    |
      | 2  | ruby  | active   | value    |
      | 3  | rails | inactive | value    |
      | 4  | pete  | active   | value    |

  Scenario: Map Values in a column
    # @map_values = Itiel::Transform::MapValues.new("state" => { "active" => 1, "inactive" => 0 })
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
    # @rename_column = Itiel::Transform::RenameColumn.new("state" => "status")
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
    # @select_column = Itiel::Transform::SelectColumn.new("id", "state")
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

  Scenario: Create a new column with the result of a calculation with other columns
    # @calculated_column = Itiel::Transform::CalculatedColumn.new 'new_id' do |columns|
    #   columns['id'].to_i * 3
    # end
    Given I create a Transformation::CalculatedColumn object that multiplies "id" times 3

    # @source.next_step     = @calculated_column
    # @calculated_column.next_step = @destination
    And the data flows in the following direction:
      | @source            |
      | @calculated_column |
      | @destination       |

    # @source.start
    When I start the source

    Then the "destination.csv" file should exist with the following content:
      | id | name  | state    | new_id |
      | 1  | john  | active   | 3      |
      | 2  | ruby  | active   | 6      |
      | 3  | rails | inactive | 9      |
      | 4  | pete  | active   | 12     |

  Scenario: Create multiple columns with the result of a calculation with other columns

    # @calculated_columns = Itiel::Transform::CalculatedColumns.new do |row|
    #   name_state = "#{row['name']}-#{row['state']}"
    #   id_name    = "#{row['id']}-#{row['name']}"
    #   { 'name_state' => name_state, 'id_name' => id_name }
    # end
    Given I create a Transformation::CalculatedColumns object

    And the data flows in the following direction:
      | @source             |
      | @calculated_columns |
      | @destination        |

    # @source.start
    When I start the source

    Then the "destination.csv" file should exist with the following content:
      | id | name  | state    | name_state     | id_name |
      | 1  | john  | active   | john-active    | 1-john  |
      | 2  | ruby  | active   | ruby-active    | 2-ruby  |
      | 3  | rails | inactive | rails-inactive | 3-rails |
      | 4  | pete  | active   | pete-active    | 4-pete  |
