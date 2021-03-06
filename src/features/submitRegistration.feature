@submit_registration
Feature: Declaration Page

    @declaration_page_happy
    Scenario: declaration page flow to application complete
        Given I reload my session
        And I go to a special QA page at url "/qa/declaration" with injected "declaration" data
        And I click on the element "submitRegistration.firstCheckbox"
        And I click on the element "submitRegistration.secondCheckbox"
        And I click on the element "submitRegistration.thirdCheckbox"
        When I click on the element "submitRegistration.button"
        Then I expect that the url is not "https://register-a-food-business-dev.azurewebsites.net/declaration"

    @declaration_page_one_checked
    Scenario: declaration page errors for one ticked
        Given I reload my session
        And I open the url "/declaration"
        When I click on the element "submitRegistration.firstCheckbox"
        And I click on the element "submitRegistration.button"
        Then I expect that element "submitRegistration.error" contains the text "You must tick all the declarations before continuing"
        Then I expect that checkbox "submitRegistration.firstCheckbox" is checked
        And I expect that checkbox "submitRegistration.secondCheckbox" is not checked
        And I expect that checkbox "submitRegistration.thirdCheckbox" is not checked

    @declaration_page_sad
    Scenario: declaration page errors for none ticked
        Given I reload my session
        And I open the url "/declaration"
        When I click on the element "submitRegistration.button"
        Then I expect that element "submitRegistration.error" contains the text "You must tick all the declarations before continuing"


