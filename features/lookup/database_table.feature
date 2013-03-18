Feature: Lookup data from a Database Table

  @database
  Scenario:
    Given a blogposts database table with rows:
      | id | title               | author          |
      | 1  | The great tool      | Tim Taylor      |
      | 2  | A football anecdote | John Miller     |
      | 3  | Historical music    | John Mellencamp |

    And an authors database table with rows:
      | id | name            |
      | 1  | Tim Taylor      |
      | 2  | John Miller     |
      | 3  | John Mellencamp |

    # @database_table = Itiel::Extract::DatabaseTable.new
    # @database_table.connection = :test
    # @database_table.table_name = 'blogposts'
    And I create a Itiel::Extract::DatabaseTable object for the 'blogposts' table

    # @database_lookup = Itiel::Lookup::DatabaseTable.new
    # @database_lookup.connection    = :test
    # @database_lookup.table_name    = 'author'
    And I create a Itiel::Lookup::DatabaseTable object for the "authors"

    # @database_lookup.lookup_columns = { :author => :name }
    And the lookup joins the "author" column in the source with the "name" column in the lookup stream

    # @database_lookup.joined_columns = { :id => :author_id }
    And the lookup appends the "id" column on the lookup stream to the source as "author_id"

    And the data flows in the following direction:
      | @database_table  |
      | @database_lookup |

    When I start the source

    Then the output for the lookup should be:
      | id | title               | author          | author_id |
      | 1  | The great tool      | Tim Taylor      | 1         |
      | 2  | A football anecdote | John Miller     | 2         |
      | 3  | Historical music    | John Mellencamp | 3         |
