@beacd @solo
Feature: Other Gambling and Gaming

  Scenario Outline: User answers yes and goes to Emac pages
    Given I login as an Organisation with NO enrolments
    And I navigate to the gambling/<enrolment> other page
    And I click Yes button and continue
    Then I will be redirected to emac <guidance> enrolments page

    Examples:
    | guidance     | enrolment|
    | HMRC-GTS-GBD | gbd      |
    | HMRC-GTS-RGD | rgd      |
    | HMRC-GTS-PBD | pbd      |
    | HMRC-MGD-ORG | mgd      |

  Scenario Outline: User answers no and goes to single sign on
    Given I login as an Organisation with NO enrolments
    And I navigate to the gambling/<enrolment> other page
    And I click No button and continue
    Then I will be redirected to register <header> page
    Then I will be redirected to <url> single sign on
    And I click continue

    Examples:
    | header             | url                  | enrolment|
    | Gambling Tax System| /gts-registration    | gbd      |
    | Gambling Tax System| /gts-registration    | rgd      |
    | Gambling Tax System| /gts-registration    | pbd      |
    | Machine Games Duty | /mgd/type-of-business| mgd      |

