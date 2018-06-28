@operator_name
Feature: Operator Name

    Operator Name section validation

    Background: opening url
        Given I open the url "http://localhost:3000/operator-name"

    @happy_path_SDB-35
    Scenario: happy path for Operator Name

        When I set "Bob" to the inputfield "opContactName.firstName"
        And I set "Smith" to the inputfield "opContactName.lastName"
        And I click on the element "opContactName.button"
        Then I expect that the url is not "http://localhost:3000/operator-name"

    @no_first_name_SDB-35
    Scenario: no first name input

        When I set "" to the inputfield "opContactName.firstName"
        And I set "Smith" to the inputfield "opContactName.lastName"
        And I click on the element "opContactName.button"
        Then I expect that element "opContactName.error" contains the text "Not a valid first name"

    @no_last_name_SDB-35
    Scenario: no last name input
        #Given I open the url "http://localhost:3000/operator-name"
        When I set "Bob" to the inputfield "opContactName.firstName"
#And I set "" to the inputfield "opContactName.lastName"
        #And I click on the element "opContactName.button"
        Then I expect that element "opContactName.lastName" contains the text "Smith"
        And I expect that element "opContactName.error" contains the text "Not a valid last name"

    @invalid_last_name_SDB-35
    Scenario: invalid last name input
        #Given I open the url "http://localhost:3000/operator-name"
        When I set "Bob" to the inputfield "opContactName.firstName"
        And I set "§§§" to the inputfield "opContactName.lastName"
        And I click on the element "opContactName.button"
        Then I expect that element "opContactName.error" contains the text "Not a valid last name"


    @invalid_first_name_SDB-35
    Scenario: invalid first name input
        # Given I open the url "http://localhost:3000/operator-name"
        When I set "§§§" to the inputfield "opContactName.firstName"
        And I set "Smith" to the inputfield "opContactName.lastName"
        And I click on the element "opContactName.button"
        Then I expect that element "opContactName.error" contains the text "Not a valid first name"
