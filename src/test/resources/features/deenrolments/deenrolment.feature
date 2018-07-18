@beacd

Feature: how to stop journeys for enrolments that come in to add taxes

  Scenario: Yes, I have stopped trading as a contractor or subcontractor
    Given I login as an Organisation with HMRC-CIS-ORG enrolled
    When I navigate to the cis, cis how to stop page
    And I click Yes button and continue
    Then I should be redirected to the /cis/remove page

  Scenario: CT journey comes to unique ct how-to-stop page - stop
    Given I login as an Organisation with CT preset
    When I navigate to the ct, ct how to stop page
    Then I click on stopCorporationTax.stop link
    And I click continue
    Then I will be redirected to emac IR-CT Deenrol page

  Scenario Outline: No - Goes to EMAC
    Given I login as an Organisation with <preset> preset
    When I navigate to the <url1>, <url2> how to stop page
    And I click No button and continue
    Then I will be redirected to emac <enrolment> Deenrol page

  Examples:
      | preset | url1           | url2 | enrolment |
      | EPAYE  | epaye          | paye | IR-PAYE   |
      | SA     | self-assessment| sa   | IR-SA     |

  Scenario Outline:
    Given I login as an Organisation with <enrolment> enrolled
    When I navigate to the <url1>, <url2> how to stop page
    And I click <yes/no> button and continue
    Then I will be redirected to emac <enrolment> Deenrol page

  Examples:
      | enrolment    | url1     | yes/no | url2 |
      | HMRC-CIS-ORG | cis      | No     | cis  |
      | HMRC-PSA-ORG | psa      | No     | psa  |
      | HMCE-RO      | ro       | Yes    | ro   |
      | HMRC-GTS-GBD | gambling | Yes    | gbd  |

  Scenario Outline: Yes - goes to Gov UK page
    Given I login as an Organisation with <enrolment> enrolled
    When I navigate to the <url1>, <url2> how to stop page
    And I click <yes/no> button and continue
    Then I should be redirected to <gov> Gov page

  Examples:
      | enrolment    | yes/no | url1      | url2  | gov                                                                     |
      | HMRC-PSA-ORG | Yes    | psa       | psa   |  Online service for scheme administrators and practitioners             |
      | HMCE-RO      | No     | ro        | ro    |  Fuel Duty: deregister from the Dealers In Controlled Oil Scheme (HO83) |
      | HMRC-GTS-GBS | No     | gambling  | gbd   |  Gambling Tax Service: online service guide for General Betting Duty    |

  Scenario Outline: Yes, My business stopped employing people
    Given I login as an Organisation with <preset> preset
    When I navigate to the <url1>, <url2> how to stop page
    And I click Yes button and continue
    Then I should be redirected to the <url3> page

  Examples:
      | preset   | url1            | url2    | url3                                  |
      | EPAYE    | epaye           | paye    | /epaye/remove                         |
      | SA       | self-assessment | sa      | /self-assessment/stop-self-employment |

  Scenario Outline: CT journey comes to unique ct how-to-stop page
    Given I login as an Organisation with CT preset
    When I navigate to the ct, ct how to stop page
    Then I click on stopCorporationTax.<id> link
    And I click continue
    Then I should be redirected to <gov> Gov page

    Examples:
    | id      | gov                                |
    | dormant | Dormant companies and associations |
    | close   | Closing a limited company          |