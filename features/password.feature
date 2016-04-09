Feature: Password identification
  User want to be identified with an email and password.
  He must validate his account before the can use entirely this.

  Scenario: Connection
    Given An user with an account
    When He gives his email and password
    Then He receives an signature of his identity

  Scenario: Create an account
    Given An unknow user
    When He gives an email and password
    Then An unconfirmed account is created for this user
    And He receives an email with an url to validate his account

  Scenario: Validate an account
    Given An user with an unvalidated account
    And He has receive an validation url
    When He goes to this url
    Then His account is validated
    And He receives an signature of his identity

  Scenario: Recover password
    Given An user with an account
    When He asks to recover his password
    Then He receives an email with an url to change his password

  Scenario: Change password
    Given An user with an account
    And He has receive an recover password url
    When He goes on that url to change his password
    And he provides his previous and next password
    Then His account is validated
    And His password is updated
    And He receives an signature of his identity

  Scenario: Authentication fail
    Given An user with an account
    When He fails to give his email and password
    Then He see an error that says that the couple email and password cannot be fount
