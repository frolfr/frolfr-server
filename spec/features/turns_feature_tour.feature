Feature: Scoring turns
  Background:
    Given I am a user
    And I am logged in

@javascript
  Scenario: a two-hole course
    Given there is a two-hole course
    And I've started a round on the two-hole course
    When I navigate to hole one
    And I take three shots
    Then I should see my total is three
    When I navigate to hole two
    And I update the par to four
    And I take three shots
    Then I should see my total is six
    And I should see my shooting is minus one
    When I navigate to the recap
    Then I should see my recap
