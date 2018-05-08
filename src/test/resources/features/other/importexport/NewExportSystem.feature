@beacd
Feature: Enrolment for New Export System (NES)

  Scenario:1 User goes to emac for NES enrolment if they have EORI number
    Given I login as an Organisation with NO enrolments
    When I navigate to nes enrolments page
    And I click Yes button and continue
    Then I click Yes button and continue
    Then I will be redirected to emac HMCE-NES enrolments page

  Scenario:2 User goes to CHIEF register for NES if they don't have CHIEF role
    Given I login as an Organisation with NO enrolments
    When I navigate to nes enrolments page
    And I click Yes button and continue
    Then I click No button and continue
    Then I will be redirected to register CHIEF page

  Scenario:3 User goes to Get an EORI number if they do not have an EORI number
    Given I login as an Organisation with NO enrolments
    When I navigate to nes enrolments page
    And I click No button and continue
    Then I click Yes button and continue
    And I click continue
    Then I should be redirected to EORI GovUk page

  Scenario:4 User goes to Get an EORI number if they do not have an EORI and they do not have a CHIEF role
    Given I login as an Organisation with NO enrolments
    When I navigate to nes enrolments page
    And I click No button and continue
    Then I click No button and continue
    And I click on eori-request-form link
    Then I should be redirected to EORI GovUk page