Feature: Logging in
  
  Scenario: Get blocked from access without login
    Given I go to the homepage
    Then I should see "Select a handle and click Login"

  Scenario: Login successfully
    Given I go to login
    And I fill in "Nickname" with "Joe"
    And I press "Login"
    Then I should see "Welcome Joe"

  Scenario: Login fail with blank nickname
    Given I go to login
    And I fill in "Nickname" with ""
    And I press "Login"
    Then I should see "Nickname must not be blank"
    And I should be on login

#  Scenario: Delete login
#    Given the following login_behaviors:
#      ||
#      ||
#      ||
#      ||
#      ||
#    When I delete the 3rd login_behavior
#    Then I should see the following login_behaviors:
#      ||
#      ||
#      ||
#      ||
