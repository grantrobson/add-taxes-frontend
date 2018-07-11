@beacd
Feature: Other oil and fuel

  Scenario: Yes, I Do you need to stop using the Rebated Oils Enquiry online service
    Given I login as an Organisation with active HMRC-RO enrolments
    And I navigate to the http://localhost:9730/business-account/ro/how-to-stop-ro URL
    And I click Yes button and continue
    Then I will be redirected to emac HMCE-RO Deenrol page

  Scenario: No, I need to deregister from the Rebated Oils scheme
    Given I login as an Organisation with active HMRC-RO enrolments
    And I navigate to the http://localhost:9730/business-account/ro/how-to-stop-ro URL
    And I click No button and continue
    Then I should be redirected to Fuel Duty: deregister from the Dealers In Controlled Oil Scheme (HO83) Gov page

  Scenario Outline: User goes to rebated oils emac page if the are already registered
    Given I login as an Organisation with NO enrolments
    When I navigate to the other page
    Then I select oilAndFuel and click continue
    Then I select <enrolment> and click continue
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> Enrol page

    Examples:
    | enrolment                 | guidance|
    | rebatedOilsEnquiryService | HMCE-RO |
    | tiedOilsEnquiryService    | HMCE-TO |

  Scenario Outline: User goes to fuel duty gov.uk page if they are not already registered (Rebated Oils)
    Given I login as an Organisation with NO enrolments
    When I navigate to the other page
    Then I select oilAndFuel and click continue
    Then I select <enrolment> and click continue
    And I click No button and continue
    Then I will be redirected to register <type> page
    When I click continue
    Then I should be redirected to <page> Gov page

    Examples:
    |enrolment                 | type         | page |
    |rebatedOilsEnquiryService | Rebated Oils | oil  |
    |tiedOilsEnquiryService    | Tied Oils    | oil  |