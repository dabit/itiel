Feature: Extract rows from a database using a custom SQL script

  @database
  Scenario:
    Given a blogposts database table with rows:
       | id | title              | author          |
       | 1  | The great tool     | Tim Taylor      |
       | 2  | A footbal anecdote | John Miller     |
       | 3  | Historical music   | John Mellencamp |

     When I create a Itiel::Extract::CustomSQL object with the query:
     """
       SELECT * FROM blogposts WHERE id = 3;
     """

     Then the extraction for that object should have 1 row

