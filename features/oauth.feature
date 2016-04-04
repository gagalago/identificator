Feature: Oauth2 identification
  User want to be identified with a oauth2 provider.

  Scenario: Connection
    Given An user with an account
    When He selects his provider
    And He gives his credential to this provider
    Then He receives an signature of his identity

  Scenario: Create an account
    Given An unknow user
    When He selects his provider
    And He gives his credential to this provider
    Then An account is created for this user
    And He receives an signature of his identity
