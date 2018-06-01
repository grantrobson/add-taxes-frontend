@beacd
Feature: Change VAT menu page within BTA to new assets template

  Scenario Outline: Choose VAT / Notification of Vehicle Arrivals
    Given I login as an Organisation with NO enrolments
    When I navigate to the vat add-tax page
    Then I click on the <Enrolment> enrolment
    And I click continue
    Then I should be redirected to <Page> Portal page

    Examples:
      |Enrolment | Page                                        |
      |vat       | business-registration/introduction?lang=eng |
      |nova      | nova/normal?lang=eng                        |

  Scenario Outline: Choose EC Sales List / EU Refunds, Yes VAT registered
    Given I login as an Organisation with NO enrolments
    When I navigate to the vat add-tax page
    Then I click on the <Enrolment> enrolment
    And I click continue
    And I click Yes button and continue
    Then I will be redirected to emac <Code> enrolments page

    Examples:
      |Enrolment | Code            |
      |ecsales   | HMCE-ECSL-ORG   |
      |eurefunds | HMRC-EU-REF-ORG |

  Scenario Outline: Choose EC Sales List / EU Refunds, No Not VAT registered
    Given I login as an Organisation with NO enrolments
    When I navigate to the vat add-tax page
    Then I click on the <Enrolment> enrolment
    And I click continue
    And I click No button and continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

    Examples:
      |Enrolment |
      |ecsales   |
      |eurefunds |