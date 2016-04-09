Feature: Common authentication functionnalities

  Scenario: Refreshing
    Given An signed in user
    When He asks a refresh of his signature
    Then He receives a new signature of his identity
