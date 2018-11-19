Feature: Enrolment of PODS Provider

  Scenario:
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    And I select pods and click continue
    Then I will be redirected to register What is your business type page
