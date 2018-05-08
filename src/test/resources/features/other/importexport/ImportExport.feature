@beacd

Feature: Other imports exports

  Background:
    Given I login as an Organisation with NO enrolments
    And I navigate to the import export page
  @smoke
  Scenario Outline: Users who have enrollment numbers
    Then I click on the <enrolment> enrolment
    And I click continue
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> enrolments page

    Examples:
      | enrolment | guidance     |
      | DDES      | HMCE-DDES    |
      | eBTI      | HMCE-EBTI-ORG|
      | EMCS      | HMRC-EMCS-ORG|
      | ICS       | HMRC-ICS-ORG |
      | eBTI      | HMCE-EBTI-ORG|
      | NCTS      | HMRC-NCTS-ORG|


  Scenario Outline: Users who dont have enrolment number
    Then I click on the <enrolment> enrolment
    And I click continue
    And I click No button and continue
    Then I will be redirected to register <number> page
    And I click continue
    Then I should be redirected to <number> GovUk page

    Examples:
      | enrolment | number |
      | DDES       | DAN    |
      | eBTI       | EORI   |
      | EMCS       | SEED   |
      | ICS        | EORI   |
      | NCTS       | EORI   |


  Scenario: User goes to emac for NES enrolment if they have EORI number
    Then I click on the NES enrolment
    And I click continue
    And I click Yes button and continue
    Then I click Yes button and continue
    Then I will be redirected to emac HMCE-NES enrolments page

  Scenario: User goes to CHIEF register for NES if they don't have CHIEF role
    Then I click on the NES enrolment
    And I click continue
    And I click Yes button and continue
    Then I click No button and continue
    Then I will be redirected to register CHIEF page

  Scenario: User goes to Get an EORI number if they do not have an EORI number
    Then I click on the NES enrolment
    And I click continue
    And I click No button and continue
    Then I click Yes button and continue
    And I click continue
    Then I should be redirected to EORI GovUk page

  Scenario: User goes to Get an EORI number if they do not have an EORI and they do not have a CHIEF role
    Then I click on the NES enrolment
    And I click continue
    And I click No button and continue
    Then I click No button and continue
    And I click on eori-request-form link
    Then I should be redirected to EORI GovUk page