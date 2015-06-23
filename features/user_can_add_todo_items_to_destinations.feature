Feature: User can add ToDo items to Destinations
  As a User
  I want to add ToDo entries
  So I can organise my life

  Scenario: Successfully add ToDo items to a Destination
    Given I am registered
    And I have created Destinations
    When I view my Bucket List
    And I add a ToDo item to a Destination
    Then The ToDo item appears under Destination on the Bucket List
    And The ToDo item has longitude and latitude
