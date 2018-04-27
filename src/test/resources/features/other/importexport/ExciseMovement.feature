@beacd
Feature: Enrolment for Import Control System(ICS)

  Scenario:1 User goes to emac for EMCS enrolment if they have SEED number
    Given I login as an Organisation with NO enrolments
    Then I will be on the Add taxes page
    When I navigate to emcs enrolments page
    And I select Yes for SEED number and continue
    Then I will be redirected to emac emcs enrolments page

  Scenario:2 User goes to emac for EMCS enrolment if they do not have SEED number
    Given I login as an Organisation with NO enrolments
    Then I will be on the Add taxes page
    When I navigate to emcs enrolments page
    And I select No for SEED number and continue
    Then I will be redirected to register SEED page
    And I click continue
    Then I should be redirected to SEED GovUk page
