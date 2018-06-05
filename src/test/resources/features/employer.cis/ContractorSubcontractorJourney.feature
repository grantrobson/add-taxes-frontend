@beacd
Feature: New design and navigation for contractor or subcontractor page

  Scenario: NO enrolments, not based in the UK
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis employer page
    And I click No button and continue
    Then I should be redirected to Construction Industry Scheme: businesses based outside UK Gov page

  Scenario: EPAYE preset, not based in the UK
    Given I login as an Organisation with EPAYE preset
    And I navigate to the cis employer page
    And I click No button and continue
    Then I should be redirected to Construction Industry Scheme: businesses based outside UK Gov page

  Scenario Outline: NO enrolments, based in the UK, Contractor or Subcontractor
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis employer page
    And I click Yes button and continue
    Then I click on the <Choice> enrolment
    And I click continue
    Then I should be redirected to the <Page> page

  Examples:
  | Choice        | Page                                                    |
  | Contractor    | /business-account/add-tax/employer/cis/uk/contractor    |
  | Subcontractor | /business-account/add-tax/employer/cis/uk/subcontractor |

  Scenario: EPAYE preset, based in the UK, Contractor
    Given I login as an Organisation with EPAYE preset
    And I navigate to the cis employer page
    And I click Yes button and continue
    Then I click on the Contractor enrolment
    And I click continue
    Then I should be redirected to service/construction-ind-scheme?action=enrol&step=enterdetails&lang=eng Portal page