Feature: Signing Up
  Scenario: first time user
    When I visit the sign up page
    And I fill out the sign up form
    Then I see I have signed up
