Feature: Load data into a database table

  Background:
    Given a blogpost database table
    And a "source.csv" file with the following rows:
      | id | title                 | author          |
      | 1  | Pride and Prejudice   | Jane Austen     |
      | 2  | Treasure Island       | R L Stevenson   |
      | 3  | Steve Jobs            | Walter Isaacson |
      | 4  | The thank you economy | Gary Vaynerchuk |

    # @source = Itiel::Extracts::CSVFile.new('source.csv')
    And I create a Extractor::CSVFile object with "source.csv"
    # @destination  = Itiel::Load::DatabaseTable.new :test, "blogposts"
    And I create a Loader::DatabaseTable object for the "blogposts" table

  @database
  Scenario:
    When I load the source into the destination
    Then the "blogposts" table should have 4 records

