@beacd
Feature: Other oil and fuel

  Background:
    Given I login as an Organisation with NO enrolments
    When I navigate to the other page
    Then I select oilAndFuel and click continue

  Scenario Outline: User goes to rebated oils emac page if the are already registered
    Then I select <enrolment> and click continue
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> Enrol page

    Examples:
    | enrolment                 | guidance|
    | rebatedOilsEnquiryService | HMCE-RO |
    | tiedOilsEnquiryService    | HMCE-TO |

  Scenario Outline: User goes to fuel duty gov.uk page if they are not already registered (Rebated Oils)
    Then I select <enrolment> and click continue
    And I click No button and continue
    Then I will be redirected to register <type> page
    When I click continue
    Then I should be redirected to <page> Gov page

    Examples:
    |enrolment                 | type         | page |
    |rebatedOilsEnquiryService | Rebated Oils | oil  |
    |tiedOilsEnquiryService    | Tied Oils    | oil  |