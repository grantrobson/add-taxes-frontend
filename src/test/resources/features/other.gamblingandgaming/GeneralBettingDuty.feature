@beacd
Feature: Other Gambling and Gaming

  Scenario Outline:
    Given I login as an Organisation with NO enrolments
    And I navigate to the gambling/gbd other page
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> enrolments page

    Examples:
    | guidance     |
    | HMRC-GTS-GBD |

  Scenario Outline:
    Given I login as an Organisation with NO enrolments
    And I navigate to the gambling/gbd other page
    And I click No button and continue
    Then I will be redirected to register <enrolment> page
    And I click continue
    Then I should be redirected to the <url> page

    Examples:
    | enrolment           | url                |
    | Gambling Tax System | /gts-registration  |
