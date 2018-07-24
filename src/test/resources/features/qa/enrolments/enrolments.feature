@qa
Feature: Enrolment journeys run in QA

  Scenario: User goes to Gov.uk when they select Intrastat from import-export page
    Given I login to QA
    Then I select addEnrolment and click continue
    And I select otherTaxes and click continue
    Then I select importsExports and click continue
    And I select ISD and click continue
    Then I will be redirected to HMCE page

  Scenario: User adds CT and is directed to portal (One of big four taxes)
    Given I login to QA
    Then I select addEnrolment and click continue
    And I select corporationTax and click continue
    Then I should be redirected to business-registration/introduction Portal page

  Scenario: User adds SA and is directed to portal (One of big four taxes)
    Given I login to QA
    Then I select addEnrolment and click continue
    And I select selfAssessment and click continue
    Then I click No button and continue
    And I select Sa and click continue
    Then I should be redirected to business-registration/introduction Portal page

  Scenario Outline: User goes to Portal when they enrol for two of big four taxes (VAT, PAYE)
    Given I login to QA
    Then I select addEnrolment and click continue
    And I select <Tax> and click continue
    Then I select <Enrolment> and click continue
    Then I should be redirected to business-registration/introduction Portal page

  Examples:
  | Tax                       | Enrolment |
  | vat                       | vat       |
  | employersOrIntermediaries | epaye     |

  Scenario Outline: import-export
    Given I login to QA
    Then I select addEnrolment and click continue
    And I select otherTaxes and click continue
    Then I select importsExports and click continue
    Then I select <enrolment> and click continue
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> Enrol page
    And I will see the emac page header

    Examples:
      | enrolment | guidance     |
      | DDES      | HMCE-DDES    |
      | eBTI      | HMCE-EBTI-ORG|
      | EMCS      | HMRC-EMCS-ORG|
      | ICS       | HMRC-ICS-ORG |
      | eBTI      | HMCE-EBTI-ORG|
      | NCTS      | HMCE-NCTS-ORG|

  Scenario Outline: import-export
    Given I login to QA
    Then I select addEnrolment and click continue
    And I select otherTaxes and click continue
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
