@beacd
Feature: Update Stamp Duty Land Tax screens in the new template

  Background:
    Given I login as an Organisation with NO enrolments
    Then I navigate to the other page
    Then I select housingAndLand and click continue

  Scenario: Stamp Duty Land Tax for a Business
    Then I select SDLT and click continue
    And I click Yes button and continue
    Then I should be redirected to the /enrol-for-stamp-taxes/enrol page

  Scenario: Stamp Duty Land Tax for a property for myself
    Then I select SDLT and click continue
    And I click No button and continue
    Then I should be redirected to the /business-account/add-tax/other/land/stamp-duty/paper-forms page
    And I click continue
    Then I should be redirected to Stamp Duty Land Tax: paper returns Gov page

  Scenario Outline: Directing ATED and Land and Buildings Tax Scotland to their own services
    And I select <Landtax> and click continue
    Then I should be redirected to the <Page> page

    Examples:
    | Landtax | Page |
    | ATED    | ated/home?callerId=bta               |
    | LBT     | land-buildings-transaction-tax/forms |