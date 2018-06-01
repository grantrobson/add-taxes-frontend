@beacd @solo
Feature: Redirect enrolment for Employment intermediaries (EI)

  Scenario: Yes, Yes, Sign in
    Given I login as an Organisation with NO enrolments
    And I navigate to the intermediaries employer page
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to register Use your PAYE for employers account page
    And I click continue
    Then I should be redirected to the ?continue=/business-account page

  Scenario: Yes, Yes, I want to add intermediaries
    Given I login as an Organisation with NO enrolments
    And I navigate to the intermediaries employer page
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to register Use your PAYE for employers account page
    And I click on sign-in link
    Then I should be redirected to the /employment-intermediary-report/not-enrolled page

  Scenario: Yes, No, I want to add intermediaries
    Given I login as an Organisation with NO enrolments
    And I navigate to the intermediaries employer page
    And I click Yes button and continue
    And I click No button and continue
    Then I should be redirected to the /employment-intermediary-report/not-enrolled page

  Scenario: No, register
    Given I login as an Organisation with NO enrolments
    And I navigate to the intermediaries employer page
    And I click No button and continue
    And I click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: No, not now
    Given I login as an Organisation with NO enrolments
    And I navigate to the intermediaries employer page
    And I click No button and continue
    And I click on not-now link
    Then I should be redirected to the /business-account page

