@beacd @zap

Feature: Corporation Tax

  Scenario: Direct CT to emac
    Given I login as an Organisation with NO enrolments
    And I navigate to the BTA /business-account/add-tax URL
    Then I select corporationTax and click continue
    Then I will be redirected to emac IR-CT Enrol page