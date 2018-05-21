@beacd
Feature: Redirect enrolment of Charities - for Gift Aid repayment claims to EMAC

  Scenario: Yes - we have an HMRC Charities reference
    Given I login as an Organisation with NO enrolments
    And I navigate to the charities other page
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-CHAR-ORG enrolments page

  Scenario: No - we haven't got an HMRC charities reference yet
    Given I login as an Organisation with NO enrolments
    And I navigate to the charities other page
    And I click No button and continue
    And I click continue
    Then I should be redirected to Get recognition from HMRC for your charity GovUk page