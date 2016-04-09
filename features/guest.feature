Feature: Guest authentication
  User want to be identified without any information.

  Scenario: Create an account
    Given An unknow user
    When He ask an guest identity
    Then An account is created for this user
    And He receives an signature of his identity

  Scenario: Update email
    Given An signed in gest user
    When He give an email
    Then His account is updated and changed to an unvalidated email provider
    And He receives an email with an url to validate his account and change his password
    And He receives an signature of his identity

  Scenario: Update information
    Given An signed in gest user
    When He give some information about him
    Then His account is updated
