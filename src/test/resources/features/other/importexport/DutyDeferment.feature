@beacd
Feature: Enrolment for Duty Deferment Enrolment System(DDES)

  Scenario:1 User goes to DDES for EMCS enrolment if they have DAN number
    Given I login as an Organisation with NO enrolments
    Then I will be on the Add taxes page
    When I navigate to ddes enrolments page
    And I select Yes for DAN number and continue
    Then I will be redirected to emac ddes enrolments page

  Scenario:2 User goes to DDES for EMCS enrolment if they do not have DAN number
    Given I login as an Organisation with NO enrolments
    Then I will be on the Add taxes page
    When I navigate to ddes enrolments page
    And I select No for DAN number and continue
    Then I will be redirected to register DAN page
    And I click continue
    Then I should be redirected to DAN GovUk page
