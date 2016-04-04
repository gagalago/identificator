Feature: Multiple provider
  User want to be or is identified with more than one provider.

  Scenario: Add a provider
    Given An signed in user
    When He logs with another identity
    Then The previous and the new identity belongs to this user
    And He receives an signature of his identity

  Scenario: Validate and merge on email
    Given An signed out user with an account and an email
    When He has create a new account with the email and a password
    Then The previous and the new identity belongs to different user
    And He receives an email with an url to validate his new identity

  Scenario: Validate and merge on email
    Given An user with an unvalidated email and password identity
    And Another user with an account with the same email
    When He valids his email
    Then The previous and the new identity belongs to the same merged user
    And He receives an signature of his identity
