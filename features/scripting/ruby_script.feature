Feature: Ruby scripting

  Scenario:
    Given the following data is in the stream:
       | id | title               | author          |
       | 1  | The great tool      | Tim Taylor      |
       | 2  | A football anecdote | John Miller     |
       | 3  | Historical music    | John Mellencamp |

    And I create a Itiel::Scripting::RubyScript object with the following block of code:
      """
        row["slug"] = row["title"].parameterize
      """

    Then the resulting output stream should be:
       | id | title               | author          | slug                |
       | 1  | The great tool      | Tim Taylor      | the-great-tool      |
       | 2  | A football anecdote | John Miller     | a-football-anecdote |
       | 3  | Historical music    | John Mellencamp | historical-music    |
