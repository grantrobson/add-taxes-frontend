@beacd
Feature: Other Gambling and Gaming
@zap
  Scenario Outline: User answers yes and goes to Emac pages
    Given I login as an Organisation with NO enrolments
    When I navigate to the other page
    Then I select gamblingAndGaming and click continue
    Then I select <enrolment> and click continue
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> Enrol page

    Examples:
    | guidance     | enrolment|
    | HMRC-GTS-GBD | GBD      |
    | HMRC-GTS-RGD | RGD      |
    | HMRC-GTS-PBD | PBD      |
    | HMRC-MGD-ORG | MGD      |

  Scenario Outline: User answers no and goes to single sign on
    Given I login as an Organisation with NO enrolments
    When I navigate to the other page
    Then I select gamblingAndGaming and click continue
    Then I select <enrolment> and click continue
    And I click No button and continue
    Then I will be redirected to register <header> page
    Then I will be redirected to <url> single sign on
    And I click continue

    Examples:
    | header               | url                          | enrolment|
    | General Betting Duty | /gts-registration            | GBD      |
    | Remote Gaming Duty   | /gts-registration            | RGD      |
    | Pool Betting Duty    | /gts-registration            | PBD      |
    | Machine Games Duty   | mgd/type-of-business?lang=eng| MGD      |