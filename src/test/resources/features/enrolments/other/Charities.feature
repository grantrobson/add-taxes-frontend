@beacd
Feature: Redirect enrolment of Charities - for Gift Aid repayment claims to EMAC

Background:
  Given I login as an Organisation with NO enrolments
  And I navigate to the other page
  Then I select charities and click continue

  Scenario: Yes - we have an HMRC Charities reference
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-CHAR-ORG Enrol page

  Scenario: No - we haven't got an HMRC charities reference yet
    And I click No button and continue
    And I click continue
    Then I should be redirected to Get recognition from HMRC for your charity Gov page