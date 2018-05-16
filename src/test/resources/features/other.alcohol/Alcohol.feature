@beacd

  Feature: Alcohol

    Scenario Outline: User answers yes and goes to Emac pages
      Given I login as an Organisation with NO enrolments
      And I navigate to the alcohol/<enrolment> other page
      And I click Yes button and continue
      Then I will be redirected to emac <guidance> enrolments page

      Examples:
        | guidance      | enrolment|
        | HMCE-ATWD-ORG | atwd     |

    Scenario Outline: User answers no and goes to single sign on
      Given I login as an Organisation with NO enrolments
      And I navigate to the alcohol/<enrolment> other page
      And I click No button and continue
      Then I will be redirected to register <header> page
      And I click continue
      Then I should be redirected to <url> GovUk page

      Examples:
        | header                 | url  | enrolment|
        | excise warehousekeeper | EX61 | atwd     |