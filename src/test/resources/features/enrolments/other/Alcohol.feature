@beacd
  Feature: Alcohol

    Scenario: User answers yes and goes to Emac pages
      Given I login as an Organisation with NO enrolments
      And I navigate to the other page
      Then I select alcoholAndTobaccoWholesalingAndWarehousing and click continue
      Then I select atwd and click continue
      And I click Yes button and continue
      Then I will be redirected to emac HMCE-ATWD-ORG Enrol page
@zap
    Scenario: User answers no and goes to single sign on
      Given I login as an Organisation with NO enrolments
      And I navigate to the other page
      Then I select alcoholAndTobaccoWholesalingAndWarehousing and click continue
      Then I select atwd and click continue
      And I click No button and continue
      Then I will be redirected to register excise warehousekeeper page
      And I click continue
      Then I should be redirected to EX61 Gov page

    Scenario: Make sure Alcohol Wholesaler Registration Scheme (AWRS) is directed to their service
      Given I login as an Organisation with NO enrolments
      And I navigate to the other page
      Then I select alcoholAndTobaccoWholesalingAndWarehousing and click continue
      Then I select awrs and click continue
      Then I should be redirected to the awrs page