@beacd

Feature: how to stop journeys for enrolments that come in to add taxes

  Scenario: CT journey comes to unique ct how-to-stop page - stop
    Given I login as an Organisation with CT preset
    When I navigate to the ct, ct how to stop page
    Then I click on stopCorporationTax.stop link
    And I click continue
    Then I will be redirected to emac IR-CT Deenrol page

  Scenario Outline:  Deenrol for Shared work space (individual) and SDLT (Organisation)
    Given I login as an <affinity> with <enrolment> enrolled
    When I navigate to the BTA /business-account/manage-account URL
    Then I click on taxes-and-duties link
    Then I click on <link> link
    Then I will be redirected to emac <enrolment> Deenrol page

  Examples:
    | affinity     | enrolment    | link              |
    | Individual   | HMRC-ECW-IND | stop-hmrc-ecw-ind |
    | Organisation | IR-SDLT-ORG  | stop-ir-sdlt-org  |
@zap
  Scenario: SA journey with CT and SA enrolled - goes to Gov.uk
    Given I login as an Organisation with IR-SA, IR-CT enrolled
    When I navigate to the self-assessment, sa how to stop page
    And I click Yes button and continue
    And I click on need-to-submit-return link
    Then I should be redirected to Check if you need to fill in a Self Assessment tax return Gov page
@zap
  Scenario: SA journey with CT and SA enrolled - goes to EACD
    Given I login as an Organisation with IR-SA, IR-CT enrolled
    When I navigate to the self-assessment, sa how to stop page
    And I click No button and continue
    Then I will be redirected to emac IR-SA Deenrol page
@zap
  Scenario Outline: Enrolment - Yes / No - Goes to page
    Given I login as an Organisation with <enrolment> enrolled
    When I navigate to the <url1>, <url2> how to stop page
    And I click <yes/no> button and continue
    Then I should be redirected to the <url3> page

  Examples:
      | enrolment       | url1      | url2        | url3                                              | yes/no |
      | HMRC-CIS-ORG    | cis       | cis         | /cis/remove                                       | Yes    |
      | HMCE-VATDEC-ORG | vat       | vat         | /vat/deregister                                   | Yes    |
      | HMRC-MOSS-U-ORG | vat       | vat-moss    | /moss-variations/org//change-reg-details?lang=eng | Yes    |
      | HMRC-MOSSNU-ORG | vat       | vat-moss-nu | /moss-variations/org//change-reg-details?lang=eng | Yes    |
      | HMRC-MGD-ORG    | gambling  | mgd         | /machine-games-duty-vars/org/?lang=eng            | No     |

  Scenario Outline: No - Goes to EMAC
    Given I login as an Organisation with <preset> preset
    When I navigate to the <url1>, <url2> how to stop page
    And I click No button and continue
    Then I will be redirected to emac <enrolment> Deenrol page

  Examples:
      | preset | url1            | url2 | enrolment |
      | EPAYE  | epaye           | paye | IR-PAYE   |
      | SA     | self-assessment | sa   | IR-SA     |

  Scenario Outline: Yes / No - Goes to EMAC
    Given I login as an Organisation with <enrolment> enrolled
    When I navigate to the <url1>, <url2> how to stop page
    And I click <yes/no> button and continue
    Then I will be redirected to emac <enrolment> Deenrol page

  Examples:
      | enrolment       | url1      | yes/no | url2        |
      | HMRC-CIS-ORG    | cis       | No     | cis         |
      | HMRC-PSA-ORG    | psa       | No     | psa         |
      | HMCE-RO         | ro        | Yes    | ro          |
      | HMRC-GTS-GBD    | gambling  | Yes    | gbd         |
      | HMCE-VATDEC-ORG | vat       | No     | vat         |
      | HMRC-CHAR-ORG   | charities | No     | charities   |
      | HMRC-MOSS-U-ORG | vat       | No     | vat-moss    |
      | HMRC-MOSSNU-ORG | vat       | No     | vat-moss-nu |
      | HMRC-GTS-PBD    | gambling  | Yes    | pbd         |
      | HMRC-GTS-RGD    | gambling  | Yes    | rgd         |
      | HMRC-MGD-ORG    | gambling  | Yes    | mgd         |

  Scenario Outline: Yes - goes to Gov UK page
    Given I login as an Organisation with <enrolment> enrolled
    When I navigate to the <url1>, <url2> how to stop page
    And I click <yes/no> button and continue
    Then I should be redirected to <gov> Gov page

  Examples:
      | enrolment       | yes/no | url1      | url2       | gov                                                                                                           |
      | HMRC-PSA-ORG    | Yes    | psa       | psa        | Online service for scheme administrators and practitioners                                                    |
      | HMCE-RO         | No     | ro        | ro         | Fuel Duty: deregister from the Dealers In Controlled Oil Scheme (HO83)                                        |
      | HMRC-GTS-GBS    | No     | gambling  | gbd        | Gambling Tax Service: online service guide for General Betting Duty                                           |
      | HMRC-CHAR-ORG   | Yes    | charities | charities  | How to close a charity                                                                                        |
      | HMRC-GTS-PBD    | No     | gambling  | pbd        | Gambling Tax Service: online service guide for General Betting Duty, Pool Betting Duty and Remote Gaming Duty |
      | HMRC-GTS-RGD    | No     | gambling  | rgd        | Gambling Tax Service: online service guide for General Betting Duty, Pool Betting Duty and Remote Gaming Duty |
@zap
  Scenario Outline: Yes, My business stopped employing people
    Given I login as an Organisation with <preset> preset
    When I navigate to the <url1>, <url2> how to stop page
    And I click Yes button and continue
    Then I should be redirected to the <url3> page

  Examples:
      | preset | url1            | url2 | url3                                  |
      | EPAYE  | epaye           | paye | /epaye/remove                         |
      | SA     | self-assessment | sa   | /self-assessment/stop-self-employment |

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