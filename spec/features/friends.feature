Feature: Friends
  Background:
    Given I am a pending test
    Given I am a user
    And I am logged in
    And there is another user

  @pending
  Scenario: adding friends
    When I navigate to friends
    And I add the other user as a friend
    Then I should see that user is now a friend
