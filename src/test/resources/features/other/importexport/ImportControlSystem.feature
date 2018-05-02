@beacd
Feature: Enrolment for Import Control System(ICS)

  Scenario: User goes to emac for ICS enrolment if they have EORI number
    Given I login as an Organisation with NO enrolments
    Then I will be on the Add taxes page
    When I navigate to ics enrolments page
    And I click Yes button and continue
    Then I will be redirected to emac ics enrolments page


  Scenario: User goes to emac for ICS enrolment if they have EORI number
    Given I login as an Organisation with NO enrolments
    Then I will be on the Add taxes page
    When I navigate to ics enrolments page
    And I click No button and continue
    Then I will be redirected to register EORI page
    And I click continue
    Then I should be redirected to EORI GovUk page
