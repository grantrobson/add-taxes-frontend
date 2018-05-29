@beacd
Feature: Try to enrol for Employment related securities (ERS) when do not have PAYE for employers

  Scenario: Yes Yes Sign In
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers/epaye/other-account employer page
    Then I will be redirected to register Use your PAYE for employers account page
    And I click submit
    Then I should be redirected to the ?continue=/business-account page

  Scenario: Yes Yes Not Now
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers/epaye/other-account employer page
    Then I will be redirected to register Use your PAYE for employers account page
    When I click on not-now link
    Then I should be redirected to the /business-account page

  Scenario: Yes No Register
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers/epaye employer page
    And I click No button and continue
    Then I will be redirected to register Add PAYE for employers first page
    And I click submit
    Then I will be redirected to emac IR-PAYE enrolments page

  Scenario: Yes No Not Now
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers/epaye employer page
    And I click No button and continue
    Then I will be redirected to register Add PAYE for employers first page
    When I click on not-now link
    Then I should be redirected to the /business-account page

  Scenario: No, Register
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers employer page
    And I click No button and continue
    Then I will be redirected to register Register for PAYE page
    And I click submit
    Then I should be redirected to /business-registration/introduction?lang=eng Portal page

  Scenario: No, Not Now
    Given I login as an Organisation with NO enrolments
    And I navigate to the ers employer page
    And I click No button and continue
    Then I will be redirected to register Register for PAYE page
    When I click on not-now link
    Then I should be redirected to the /business-account page