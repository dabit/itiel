Feature: Extract data from a Database Table

  @database
  Scenario:
    Given a blogpost database table with rows:
       | id | title              | author          |
       | 1  | The great tool     | Tim Taylor      |
       | 2  | A footbal anecdote | John Miller     |
       | 3  | Historical music   | John Mellencamp |

    # @database_table = Itiel::Extractor::DatabaseTable.new
    # @database_table.connection = :test
    # @database_table.table_name = 'blogposts'
    When I create a Itiel::Extractor::DatabaseTable object for the 'blogposts' table
    Then the extraction for that object should have 3 rows

