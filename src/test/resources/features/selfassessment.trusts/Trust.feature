@beacd
Feature: Enrol trust through Self Assessment journey

  Scenario: User answers Yes - the trust is already registered
    Given I login as an Organisation with NO enrolments
    And I navigate to the trust self assessment page
    When I click Yes button and continue
    Then I will be redirected to emac IR-SA-TRUST-ORG enrolments page

  Scenario: User answers No - the trust is not already registered
    Given I login as an Organisation with NO enrolments
    And I navigate to the trust self assessment page
    When I click No button and continue
    Then I will be redirected to register trust page
    When I click continue
    Then I should be redirected to Trusts GovUk page

  Scenario:
    Given I login as an Organisation with NO enrolments
    And I navigate to the trust self assessment page
    When I click No button and continue
    Then I will be redirected to register trust page
    When I click on not-now link
    Then I should be redirected to the /business-account/ page