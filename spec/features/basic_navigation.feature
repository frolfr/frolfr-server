Feature: Basic Navigation
  Background:
    Given I am a user
    And I am logged in

  Scenario: visiting courses
    Given there is a course
    And I've played the course
    When I navigate to courses
    Then I should see the course
