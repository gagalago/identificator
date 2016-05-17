Feature: Password identification
  User want to be identified with an email and password.
  He must validate his account before the can use entirely this.

  Scenario: Connection
    Given An user with an account
    When He sign in with an email and password
    Then He receives an signature of his identity

  Scenario: Create an account with password
    Given An unknow user
    When He sign up with his email and password
    Then An unconfirmed account is created for this user
    And He receives an email with an url to validate his account

  Scenario: Validate an account with password
    Given An user with an unvalidated account
    And He has receive an validation url
    When He goes to that url
    Then His account is validated
    And He receives an signature of his identity

  Scenario: Create an account without password
    Given An unknow user
    When He sign up with only an email
    Then An unconfirmed account is created for this user
    And He receives an email with an url to change his password

  Scenario: Recover password
    Given An user with an account
    When He asks to recover his password
    Then He receives an email with an url to change his password

  Scenario: Change password
    Given An user with an account
    And He has receive an recover password url
    When He goes to that url to change his password
    And He provides his previous and next password
    Then His account is validated
    And His password is updated
    And He receives an signature of his identity
