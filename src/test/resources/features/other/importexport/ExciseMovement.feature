@beacd
Feature: Enrolment for Excise Movement(ICS)

  Scenario:1 User goes to emac for EMCS enrolment if they have SEED number
    Given I login as an Organisation with NO enrolments
    When I navigate to emcs enrolments page
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-EMCS-ORG enrolments page

  Scenario:2 User goes to emac for EMCS enrolment if they do not have SEED number
    Given I login as an Organisation with NO enrolments
    When I navigate to emcs enrolments page
    And I click No button and continue
    Then I will be redirected to register SEED page
    And I click continue
    Then I should be redirected to SEED GovUk page
