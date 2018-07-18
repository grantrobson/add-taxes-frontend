@beacd

Feature: how to stop journeys for enrolments that come in to add taxes

  Scenario: CT journey comes to unique ct how-to-stop page - stop
    Given I login as an Organisation with CT preset
    When I navigate to the ct, ct how to stop page
    Then I click on stopCorporationTax.stop link
    And I click continue
    Then I will be redirected to emac IR-CT Deenrol page

  Scenario Outline: Enrolment - Yes / No - Goes to page
    Given I login as an Organisation with <enrolment> enrolled
    When I navigate to the <url1>, <url2> how to stop page
    And I click <yes/no> button and continue
    Then I should be redirected to the <url3> page

  Examples:
    | enrolment       | url1 | url2 | url3            | yes/no |
    | HMRC-CIS-ORG    | cis  | cis  | /cis/remove     | Yes    |
    | HMCE-VATDEC-ORG | vat  | vat  | /vat/deregister | Yes    |

  Scenario Outline: No - Goes to EMAC
    Given I login as an Organisation with <preset> preset
    When I navigate to the <url1>, <url2> how to stop page
    And I click No button and continue
    Then I will be redirected to emac <enrolment> Deenrol page

  Examples:
      | preset | url1           | url2 | enrolment |
      | EPAYE  | epaye          | paye | IR-PAYE   |
      | SA     | self-assessment| sa   | IR-SA     |

  Scenario Outline: Yes / No - Goes to EMAC
    Given I login as an Organisation with <enrolment> enrolled
    When I navigate to the <url>, <url> how to stop page
    And I click <yes/no> button and continue
    Then I will be redirected to emac <enrolment> Deenrol page

  Examples:
      | enrolment       | url | yes/no |
      | HMRC-CIS-ORG    | cis | No     |
      | HMRC-PSA-ORG    | psa | No     |
      | HMCE-RO         | ro  | Yes    |
      | HMCE-VATDEC-ORG | vat | No     |

  Scenario Outline: Yes - goes to Gov UK page
    Given I login as an Organisation with <enrolment> enrolled
    When I navigate to the <url>, <url> how to stop page
    And I click <yes/no> button and continue
    Then I should be redirected to <gov> Gov page

  Examples:
      | enrolment    | yes/no | url | gov                                                                    |
      | HMRC-PSA-ORG | Yes    | psa | Online service for scheme administrators and practitioners             |
      | HMCE-RO      | No     | ro  | Fuel Duty: deregister from the Dealers In Controlled Oil Scheme (HO83) |

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