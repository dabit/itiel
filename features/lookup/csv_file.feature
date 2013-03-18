Feature: Lookup data from a CSV file

  @database
  Scenario:
    Given an orders database table with rows:
      | id | email            |
      | 1  | john@example.com |
      | 2  | tim@test.com     |
      | 3  | math@example.com |

    And a "customers.csv" file with the following rows:
      | id | email            |
      | 1  | john@example.com |
      | 2  | tim@test.com     |
      | 3  | math@example.com |

    # @database_table = Itiel::Extract::DatabaseTable.new
    # @database_table.connection = :test
    # @database_table.table_name = 'orders'
    And I create a Itiel::Extract::DatabaseTable object for the 'orders' table

    # @lookup = Itiel::Lookup::CSVFile.new('customers.csv')
    And I create a Itiel::Lookup::CSVFile object with the "customers.csv" file

    # @lookup.lookup_columns = { :email => :email }
    And the lookup joins the "email" column in the source with the "email" column in the lookup stream

    # @lookup.joined_columns = { :id => :customer_id }
    And the lookup appends the "id" column on the lookup stream to the source as "customer_id"

    And the data flows in the following direction:
      | @database_table  |
      | @lookup          |

    When I start the source

    Then the output for the lookup should be:
      | id | email            | customer_id |
      | 1  | john@example.com | 1           |
      | 2  | tim@test.com     | 2           |
      | 3  | math@example.com | 3           |
