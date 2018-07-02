@charity_details_SDB-40
Feature: Testing charity details page: As Jamie I want to declare the details of the charity which operates the food business, so that I register with the correct details

Charity Details section validation

    @charity_details_happy_path_SDB-40
    Scenario: testing charity details happy path
        Given I open the url "http://localhost:3000/operator-charity-details"
        When I set "Charity Name example" to the inputfield "charityDetails.charityName"
        And I set "12345678" to the inputfield "charityDetails.charityNumber"
        Then I click on the element "charityDetails.button"
        And I expect that the url is not "http://localhost:3000/operator-charity-details"


    @charity_details_not_filled_name_SDB-40
    Scenario: testing error message when not input charity name
        Given I reload my session
        And I open the url "http://localhost:3000/operator-charity-details"
        When I set "12345678" to the inputfield "charityDetails.charityNumber"
        And I click on the element "charityDetails.button"
        Then I expect that element "charityDetails.error" contains the text "Not a valid charity name"
        And I expect that element "charityDetails.charityNumber" contains the text "12345678"

    @charity_details_not_filled_number_SDB-40
    Scenario: testing error message when not input charity number
        Given I reload my session
        And I open the url "http://localhost:3000/operator-charity-details"
        When I set "Charity Name example" to the inputfield "charityDetails.charityName"
        And I click on the element "charityDetails.button"
        Then I expect that element "charityDetails.error" contains the text "Not a valid charity number"
        And I expect that element "charityDetails.charityName" contains the text "Charity Name example"

    @charity_details_invalid_number_SDB-40
    Scenario: testing error message when input invalid charity number
        Given I reload my session
        And I open the url "http://localhost:3000/operator-charity-details"
        When I set "Charity Name example" to the inputfield "charityDetails.charityName"
        And I set "±±±±" to the inputfield "charityDetails.charityNumber"
        And I click on the element "charityDetails.button"
        Then I expect that element "charityDetails.error" contains the text "Not a valid charity number"
        And I expect that element "charityDetails.charityName" contains the text "Charity Name example"

# @charity_details_more_info_SDB-40
# Scenario: testing more info for charity details
#     Given I reload my session
#     And I open the url "http://localhost:3000/operator-charity-details"
#     When I click on the element "charityDetails.questions"
#     And I click on the element "charityDetails.link"
#     Then I expect that the url is ""


