@beacd
Feature: Try to enrol for Employment related securities (ERS) when do not have PAYE for employers

  Scenario Outline: Yes, Yes, Not Now & Yes, No, Not Now journeys
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers employer page
    And I click Yes button and continue
    And I click <Choice> button and continue
    Then I will be redirected to register <Title> page
    When I click on not-now link
    Then I should be redirected to the /business-account page

    Examples:
      | Choice  | Title                               |
      | Yes     | Use your PAYE for employers account |
      | No      | Add PAYE for employers first        |

  Scenario: Yes, Yes, Sign In
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers employer page
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to register Use your PAYE for employers account page
    And I click continue
    Then I should be redirected to the ?continue=/business-account page

  Scenario: Yes, No, Register
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers employer page
    And I click Yes button and continue
    And I click No button and continue
    Then I will be redirected to register Add PAYE for employers first page
    And I click continue
    Then I will be redirected to emac IR-PAYE enrolments page

  Scenario: No, Register
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers employer page
    And I click No button and continue
    Then I will be redirected to register Register for PAYE page
    And I click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: No, Not Now
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers employer page
    And I click No button and continue
    Then I will be redirected to register Register for PAYE page
    When I click on not-now link
    Then I should be redirected to the /business-account page