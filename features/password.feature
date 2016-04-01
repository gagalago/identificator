Feature: Password identification
  User want to be identified with an email and password.
  He must validate his account before the can use entirely this.

  Scenario: Create an account
    Given An unknow user
    When He give an email and password
    Then An unconfirmed account is created for this user
    And He receive an email with an url to validate his account

  Scenario: Validate an account
    Given An user with an unvalidated account
    And He has receive an validation url
    When He go to this url
    Then His account is validated

  Scenario: Recover password
    Given An user with an account
    When He ask to recover his password
    Then He receive an email with an url to change his password

  Scenario: Change password
    Given An user with an account
    When He go on an url to change his password
    And he provide his previous and next password
    Then His account is updated
