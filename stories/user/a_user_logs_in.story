Story: a user logs in
    As a user on the site
    I log in
    So I can do cool stuff

Scenario: I log in and see a welcome message
    Given an anonymous user
    And an activated user named 'john'
    When I log in as john
    Then the browser should show "john logged in successfully"