@beacd

  Feature: Corporation Tax

    Background: Getting into the add tax CT journey
      Given I login as an Organisation with NO enrolments
      And I navigate to the BTA /business-account/add-tax URL
      Then I select corporationTax and click continue

    Scenario: User has a UTR
      And I select Yes and click continue
      Then I will be redirected to emac IR-CT Enrol page

    Scenario: User doesn not have a UTR
      And I select No and click continue
      Then I should be redirected to business-registration/select-taxes Portal page
