@beacd
Feature: Pension Schemes

  Scenario Outline: Users who have enrollment numbers
    Given I login as an Organisation with NO enrolments
    And I navigate to the pension employer page
    Then I select <enrolment> and click continue
    Then I should be redirected to <guidance> Portal page
    Examples:
      | enrolment       | guidance                        |
      | administrators  | service/pensions-administrators |
      | practitioners   | service/pensions-practitioners  |