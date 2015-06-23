Feature: User can add Destinations
  As a User
  I want to add Destinations
  So that I can assign my Bucket List entries

  Scenario: Successfully adding a Destination
    Given I am registered
    When I add a uniquely named Destination
    Then the Destination appears on my Bucket List
