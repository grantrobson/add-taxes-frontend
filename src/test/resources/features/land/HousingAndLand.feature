@beacd
Feature: Update Stamp Duty Land Tax screens in the new template

  Scenario: Stamp Duty Land Tax for a Business
    Given I login as an Organisation with NO enrolments
    And I click Yes button and continue
    Then I should be redirected to service/stamp-taxes?action=enrol&step=enterdetails Portal page

  Scenario: Stamp Duty Land Tax for a property for myself
    Given I login as an Organisation with NO enrolments
    Then I navigate to the land/stamp-duty other page
    And I click No button and continue
    Then I should be redirected to the /business-account/add-tax/other/land/stamp-duty/paper-forms page
    And I click continue
    Then I should be redirected to Stamp Duty Land Tax: paper returns Gov page

    Scenario Outline: Directing ATED and Land and Buildings Tax Scotland to their own services
      Given I login as an Organisation with NO enrolments
      Then I navigate to the land other page
      And I select <Landtax> and click continue
      Then I should be redirected to the <Page> page

      Examples:
      | Landtax | Page |
      | ATED    | ated/home?callerId=bta               |
      | LBT     | land-buildings-transaction-tax/forms |

