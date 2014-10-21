Feature: Basic Navigation
  Background:
    Given I am a pending test
    Given I am a user
    And I am logged in

  @pending
  Scenario: visiting courses
    Given there is a course
    And I've played the course
    When I navigate to courses
    Then I should see the course

  @pending
  Scenario: updating profile
    When I navigate to my profile
    And I submit the profile form
    Then I should see my profile has been updated
