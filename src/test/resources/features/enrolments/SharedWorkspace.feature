@beacd

Feature: Shared Workspace (Individuals)

  Scenario: Individual adding Shared Workspace via BTA
    Given I login as an Individual with NO enrolments
    And I navigate to the BTA /business-account/add-tax URL
    Then I select sharedWorkspace and click continue
    And I will be redirected to emac HMRC-ECW-IND Enrol page