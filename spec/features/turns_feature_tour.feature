Feature: Scoring turns
  Background:
    Given I am a pending test
    Given I am a user
    And I am logged in

@javascript
  Scenario: a two-hole course
    Given there is a two-hole course
    And I've started a round on the two-hole course
    When I navigate to hole one
    And I take three shots
    And I update the par to four
    When I navigate to hole two
    Then I should see my total is three
    And I take three shots
    When I navigate to the recap
    Then I should see my recap
