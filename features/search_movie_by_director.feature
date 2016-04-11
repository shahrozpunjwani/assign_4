Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Movie_1    | R     | Director_1 |   2015-07-01 |
  | Movie_2 | R     | Director_2 |   2015-07-11 |
  | Movie_3        | R      |              |   2010-07-01 |
  | Movie_4     | PG      | Director_1 |   2001-07-21 |

Scenario: add director to existing movie
  When I go to the edit page for "Movie_3"
  And  I fill in "Director" with "Director_3"
  And  I press "Update Movie Info"
  Then the director of "Movie_3" should be "Director_3"

Scenario: find movie with same director
  Given I am on the details page for "Movie_1"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Movie_1"
  And   I should see "Movie_4"
  But   I should not see "Director_2"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Movie_3"
  Then  I should not see "Director_3"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Movie_3' has no director info"