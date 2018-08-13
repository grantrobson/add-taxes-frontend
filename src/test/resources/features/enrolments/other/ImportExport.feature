@beacd
Feature: Other imports exports

  Scenario: User goes to emac for NES enrolment if they have EORI number
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select importsExports and click continue
    Then I select NES and click continue
    And I click Yes button and continue
    Then I click Yes button and continue
    Then I will be redirected to emac HMCE-NES Enrol page

  Scenario: User goes to CHIEF register for NES if they don't have CHIEF role
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select importsExports and click continue
    Then I select NES and click continue
    And I click Yes button and continue
    Then I click No button and continue
    Then I will be redirected to register CHIEF page

  Scenario: User goes to Get an EORI number if they do not have an EORI number
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select importsExports and click continue
    Then I select NES and click continue
    And I click No button and continue
    Then I click Yes button and continue
    And I click continue
    Then I should be redirected to EORI Gov page

  Scenario: User goes to Get an EORI number if they do not have an EORI and they do not have a CHIEF role
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select importsExports and click continue
    Then I select NES and click continue
    And I click continue
    And I click No button and continue
    Then I click No button and continue
    And I click on eori-request-form link
    Then I should be redirected to EORI Gov page
@zap
  Scenario: User goes to Gov.uk when they select Intrastat from import-export page
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select importsExports and click continue
    Then I select ISD and click continue
    Then I will be redirected to HMCE page

  Scenario: User goes to Portal when they select NOVA from import export page
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select importsExports and click continue
    Then I select NOVA and click continue
    Then I should be redirected to nova Portal page

  Scenario Outline: Users who have enrollment numbers
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select importsExports and click continue
    Then I select <enrolment> and click continue
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> Enrol page

    Examples:
      | enrolment | guidance     |
      | DDES      | HMCE-DDES    |
      | eBTI      | HMCE-EBTI-ORG|
      | EMCS      | HMRC-EMCS-ORG|
      | ICS       | HMRC-ICS-ORG |
      | eBTI      | HMCE-EBTI-ORG|
      | NCTS      | HMCE-NCTS-ORG|

  Scenario Outline: Users who dont have enrolment number
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select importsExports and click continue
    Then I select <enrolment> and click continue
    And I click No button and continue
    Then I will be redirected to register <number> page
    And I click continue
    Then I should be redirected to <govPage> Gov page

    Examples:
      | enrolment  | number | govPage         |
      | DDES       | DAN    | VAT             |
      | eBTI       | EORI   | EORI            |
      | EMCS       | SEED   | Excise Movement |
      | ICS        | EORI   | EORI            |
      | NCTS       | EORI   | EORI            |