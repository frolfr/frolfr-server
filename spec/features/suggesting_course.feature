Feature: Suggesting courses
  Background:
    Given I am a user
    And I am logged in

  Scenario: making suggestion
    When I navigate to suggest a new course
    And I fill out the new course form
    Then I see I have suggested a course
