@beacd
Feature: Enrol trust through Self Assessment journey

  Scenario: User answers Yes - the trust is already registered
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I select Trust and click continue
    When I click Yes button and continue
    Then I will be redirected to emac IR-SA-TRUST-ORG enrolments page

  Scenario: User answers No - the trust is not already registered
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I select Trust and click continue
    When I click No button and continue
    Then I will be redirected to register trust page
    When I click continue
    Then I should be redirected to Trusts Gov page

  Scenario: User answers No - decides to add later
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I select Trust and click continue
    When I click No button and continue
    Then I will be redirected to register trust page
    When I click on not-now link
    Then I should be redirected to the /business-account page
@firefox
  Scenario: User answers Yes - add a partner to partnership
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I select Partnership and click continue
    And I click Yes button and continue
    Then I will be redirected to sa401 pdf

  Scenario: User answers No - add a partner to partnership
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I select Partnership and click continue
    And I click No button and continue
    Then I will be redirected to register partnership page
    When I click Yes button and continue
    Then I will be redirected to emac IR-SA-PART-ORG enrolments page
@firefox
  Scenario: User answers No - add a partner to partnership
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I select Partnership and click continue
    And I click No button and continue
    Then I will be redirected to register partnership page
    When I click No button and continue
    Then I will be redirected to SA400 pdf

  Scenario: User clicks self-assessment or sole trader
    Given I login as an Organisation with NO enrolments
    When I navigate to the self assessment page
    Then I select Sa and click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: User logs in as an individual and adds trust
    Given I login as an Individual with NO enrolments
    When I navigate to the self assessment page
    And I select Trust and click continue
    Then I should be redirected to the trust/new-account page

  Scenario Outline: Redirect users who have enrolled with SA or CT to the correct i-Form, No Yes already registered and have UTR
    Given I login as an Organisation with <Preset> preset
    When I navigate to the self assessment page
    Then I select Partnership and click continue
    And I click No button and continue
    Then I will be redirected to register partnership page
    And I click Yes button and continue
    Then I will be redirected to emac IR-SA-PART-ORG enrolments page

    Examples:
      | Preset |
      | SA     |
      | CT     |

  Scenario Outline: Redirect users who have enrolled with SA or CT to the correct i-Form, Yes add partner to existing partnership
    Given I login as an Organisation with <Preset> preset
    When I navigate to the self assessment page
    Then I select Partnership and click continue
    And I click Yes button and continue
    Then I should be redirected to the /forms/form/register-a-partner-or-a-partnership-for-self-assessment/start#1 page

    Examples:
      | Preset |
      | SA     |
      | CT     |

  Scenario Outline: Redirect users who have enrolled with SA or CT to the correct i-Form, No No not registered the partnership
    Given I login as an Organisation with <Preset> preset
    When I navigate to the self assessment page
    Then I select Partnership and click continue
    And I click No button and continue
    Then I will be redirected to register partnership page
    And I click No button and continue
    Then I should be redirected to the /forms/form/register-a-partner-or-a-partnership-for-self-assessment/start#1 page

    Examples:
      | Preset |
      | SA     |
      | CT     |