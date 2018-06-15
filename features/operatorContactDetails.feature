@operator_contact_details
Feature: Operator Contact Details

Simple operator contact details

  @SBD-156_happy_path
    Scenario: happy path without optional field
      Given I am on the contact details page
      When I put in a valid operator email address
      And I put in a valid operator phone number
      And I click save and continue
      Then I am taken to another page

  @SBD-156_happy_path_all_fields
    Scenario: happy path with optional field
      Given I am on the contact details page
      When I put in a valid operator email address
      And I put in a valid operator phone number
      And I put in a valid optional operator phone number
      And I click save and continue
      Then I am taken to another page

  @SBD-156_invalid_email
    Scenario: invalid email address
      Given I am on the contact details page
      When I put in an invalid operator email address
      And I click save and continue
      Then I am shown the operator email error

  @SBD-156_invalid_phone_number
    Scenario: invalid phone number
      Given I am on the contact details page
      When I put in an invalid operator phone number
      And I click save and continue
      Then I am shown the operator phone number error

  @SBD-156_no_email_address
    Scenario: no email address
      Given I am on the contact details page
      When I put in a valid operator phone number
      And I click save and continue
      Then I am shown the operator email error
  
  @SBD-156_no_phone_numnber
    Scenario: no phone number
      Given I am on the contact details page
      When I put in a valid operator email
      And I click save and continue
      Then I am shown the operator phone number error

  
     