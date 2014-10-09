Feature: Signing Up
  Scenario: first time user
    Given I am a pending test
    When I visit the sign up page
    And I fill out the sign up form
    Then I see I have signed up
