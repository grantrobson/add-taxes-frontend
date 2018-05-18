@beacd
Feature: Construction Industry Team

  Scenario: Users adding CIS not registered
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/contractor employer page
    And I click No button and continue
    Then I will be redirected to register PAYE page
    And I click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: Users adding CIS not registered not now
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/contractor employer page
    And I click No button and continue
    Then I will be redirected to register PAYE page
    When I click on not-now link
    Then I should be redirected to the /business-account page

  Scenario: Users adding CIS registered sign in
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/contractor employer page
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to /sso-sign-out?continueUrl=%2Fbusiness-account single sign on

  Scenario: Users adding CIS registered add CIS
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/contractor employer page
    And I click Yes button and continue
    And I click Yes button and continue
    When I click on add-to-this-account link
    Then I will be redirected to emac HMRC-CIS-ORG enrolments page