@beacd
Feature: Redirect enrolment Automatic Exchange of Information (AEOI) to EMAC

  Background:
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select automaticExchangeOfInformation and click continue

  Scenario: Yes - I have an ID
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-FATCA-ORG Enrol page

  Scenario: No - I haven't registered yet
    And I click No button and continue
    Then I will be redirected to register AEOI page
    And I click continue
    Then I should be redirected to fatca-registration?lang=eng Portal page