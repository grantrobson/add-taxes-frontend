@beacd @zap

Feature: Corporation Tax
  Background: Getting into the add tax CT journey
    Given I login as an Organisation with NO enrolments
    And I navigate to the BTA /business-account/add-tax URL
    Then I select corporationTax and click continue

  Scenario: Reverted BEACD-223 fix
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

#    Scenario: User has a UTR
#      And I select Yes and click continue
#      Then I will be redirected to emac IR-CT Enrol page
#
#    Scenario: User doesnt not have a UTR
#      And I select No and click continue
#      Then I should be redirected to business-registration/select-taxes Portal page