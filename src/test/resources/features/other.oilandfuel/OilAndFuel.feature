@beacd
Feature: Other oil and fuel
  
  Scenario Outline: User goes to rebated oils emac page if the are already registered
    Given I login as an Organisation with NO enrolments
    When I navigate to the oil page
    Then I click on the <enrolment> enrolment
    And I click continue
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> enrolments page

    Examples:
    | enrolment                 | guidance|
    | rebatedOilsEnquiryService | HMCE-RO |
    | tiedOilsEnquiryService    | HMCE-TO |


  Scenario Outline: User goes to fuel duty gov.uk page if they are not already registered (Rebated Oils)
    Given I login as an Organisation with NO enrolments
    When I navigate to the oil page
    Then I click on the <enrolment> enrolment
    And I click continue
    And I click No button and continue
    Then I will be redirected to register <type> page
    When I click continue
    Then I should be redirected to <page> GovUk page

    Examples:
    |enrolment                 | type         | page |
    |rebatedOilsEnquiryService | Rebated Oils | OIL  |
    |tiedOilsEnquiryService    | Tied Oils    | OIL  |