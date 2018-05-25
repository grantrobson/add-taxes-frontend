@beacd
Feature: Redirect enrolment for VAT MOSS UK if not registered for VAT

  Scenario: Chosen Mini One Stop Shop (MOSS) VAT option - Yes Yes - Register
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/uk VAT page
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to register VAT MOSS page
    Then I will be redirected to /sso-sign-out?continueUrl=%2Fbusiness-account single sign on

  Scenario: Chosen Mini One Stop Shop IOM (MOSS) VAT option - Yes Yes - Register
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/iom VAT page
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-MOSS-U-ORG enrolments page

  Scenario: Chosen Mini One Stop Shop IOM (MOSS) VAT option - Yes No - Register
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/iom VAT page
    And I click Yes button and continue
    And I click No button and continue
    Then I should be redirected to moss-registration/org/provide-vat-details?lang=eng Portal page

  Scenario: Chosen Mini One Stop Shop (MOSS) VAT option - Yes No - Register
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/uk VAT page
    And I click Yes button and continue
    And I click No button and continue
    Then I will be redirected to register VAT first page
    And I click continue
    Then I will be redirected to emac HMCE-VATDEC-ORG enrolments page

  Scenario: Chosen Mini One Stop Shop (MOSS) VAT option - No - Register
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/uk VAT page
    And I click No button and continue
    Then I will be redirected to register Register for VAT page
    And I click continue
    Then I should be redirected to business-registration/introduction Portal page

  Scenario: Chosen Mini One Stop Shop IOM (MOSS) VAT option - No - Register
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/iom VAT page
    And I click No button and continue
    Then I will be redirected to register Register for VAT page
    And I click continue
    And I should be redirected to Registering for VAT Gov page

  Scenario Outline: Chosen Mini One Stop Shop (MOSS) VAT option - No - Not now
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/<Country> VAT page
    And I click No button and continue
    Then I will be redirected to register Register for VAT page
    When I click on not-now link
    Then I should be redirected to the /business-account page

    Examples:
    |Country |
    |uk      |
    |iom     |

  Scenario Outline: Chosen Mini One Stop Shop (MOSS) VAT option - Yes No - Not Now
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/uk VAT page
    And I click <Choice1> button and continue
    And I click <Choice2> button and continue
    Then I will be redirected to register <Title> page
    When I click on not-now link
    Then I should be redirected to the /business-account page

    Examples:
      |Choice1   | Choice2   | Title         |
      |Yes       | Yes       | VAT MOSS      |
      |Yes       | No        | VAT first     |

  Scenario: Redirect enrolment for VAT MOSS outside the EU to EMAC - Yes
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/non-eu VAT page
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-MOSSNU-ORG enrolments page

  Scenario: Redirect enrolment for VAT MOSS outside the EU to EMAC - No
    Given I login as an Organisation with NO enrolments
    When I navigate to the moss/non-eu VAT page
    And I click No button and continue
    Then I should be redirected to moss-registration/org/introduction Portal page