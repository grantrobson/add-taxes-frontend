@Example

Feature: Enrolment for Import Control System

  Scenario: User goes to emac for ICS enrolment if they have EORI number
    Given I login as an Organisation with NO enrolments
    Then I will be on the Add taxes page
    When I navigate to ics enrolments page
    And I select Yes having an EORI number and continue
    Then I will be redirected to emac ics enrolments page