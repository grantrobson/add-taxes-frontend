@beacd
Feature: Enrol trust through Self Assessment journey

  Scenario: User answers Yes - the trust is already registered
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I click on the Trust enrolment
    And I click continue
    When I click Yes button and continue
    Then I will be redirected to emac IR-SA-TRUST-ORG enrolments page

  Scenario: User answers No - the trust is not already registered
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I click on the Trust enrolment
    And I click continue
    When I click No button and continue
    Then I will be redirected to register trust page
    When I click continue
    Then I should be redirected to Trusts GovUk page

  Scenario: User answers No - decides to add later
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I click on the Trust enrolment
    And I click continue
    When I click No button and continue
    Then I will be redirected to register trust page
    When I click on not-now link
    Then I should be redirected to the /business-account page
@firefox
  Scenario: User answers Yes - add a partner to partnership
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I click on the Partnership enrolment
    And I click continue
    And I click Yes button and continue
    Then I will be redirected to sa401 pdf

  Scenario: User answers No - add a partner to partnership
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I click on the Partnership enrolment
    And I click continue
    And I click No button and continue
    Then I will be redirected to register partnership page
    When I click Yes button and continue
    Then I will be redirected to emac IR-SA-PART-ORG enrolments page
@firefox
  Scenario: User answers No - add a partner to partnership
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I click on the Partnership enrolment
    And I click continue
    And I click No button and continue
    Then I will be redirected to register partnership page
    When I click No button and continue
    Then I will be redirected to SA400 pdf

  Scenario: User clicks self-assessment or sole trader
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I click on the Sa enrolment
    And I click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page
