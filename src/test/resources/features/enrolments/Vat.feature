@beacd
Feature: Redirect enrolment for VAT MOSS UK if not registered for VAT

  Scenario: New journey for users with no VRN
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select vat and click continue
    And I click Yes button and continue
    Then I will be redirected to emac HMCE-VATDEC-ORG Enrol page

  Scenario: New journey for users with VRN and want to register online
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select vat and click continue
    And I click No button and continue
    And I click Yes button and continue
    Then I should be redirected to business-registration/select-taxes?lang=eng Portal page

  Scenario: New journey for users with VRN but don't want to register online
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select vat and click continue
    And I click No button and continue
    And I click No button and continue
    And I click continue
    Then I should be redirected to VAT registration Gov page

  Scenario: Redirect INDIVIDUAL users with no VRN to Set up a new account page, clicks on Continue
    Given I login as an Individual with NO enrolments
    Then I navigate to the VAT page
    Then I select vat and click continue
    And I click No button and continue
    And I click continue
    Then I should be redirected to the government-gateway-registration-frontend?accountType=organisation&continue=%2Fbusiness-account%2Fadd-tax page

  Scenario: Redirect INDIVIDUAL users with no VRN to Set up a new account page, clicks on Not Now
    Given I login as an Individual with NO enrolments
    Then I navigate to the VAT page
    Then I select vat and click continue
    And I click No button and continue
    And I click on not-now link
    Then I should be redirected to the /business-account page

  Scenario: New set up a new account page for VAT GIANT clicks on create account
    Given I login as an Individual with NO enrolments
    Then I navigate to the VAT page
    Then I select giant and click continue
    And I click continue
    Then I should be redirected to the government-gateway-registration-frontend?accountType=organisation&continue=%2Fbusiness-account%2Fadd-tax page

  Scenario: New set up a new account page for VAT GIANT but not now
    Given I login as an Individual with NO enrolments
    Then I navigate to the VAT page
    Then I select giant and click continue
    And I click on not-now link
    Then I should be redirected to the /business-account page

  Scenario: Improve VAT enrolment journey, Yes I have a reg no
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select vat and click continue
    And I click Yes button and continue
    Then I will be redirected to emac HMCE-VATDEC-ORG Enrol page

  Scenario: Choose VAT / Notification of Vehicle Arrivals
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select nova and click continue
    Then I should be redirected to nova/normal?lang=eng Portal page

  Scenario: Enrol for Government Information and National Health Trusts: YES to NHS trust, Gov dept or Royal house
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select giant and click continue
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-VAT-GIANT Enrol page

  Scenario: Enrol for Government Information and National Health Trusts: NO to NHS trust, Gov dept or Royal house
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select giant and click continue
    And I click No button and continue
    Then I should be redirected to the /business-account/add-tax/vat/vat-giant/do-not-need-service page

  Scenario: Chosen Mini One Stop Shop (MOSS) VAT option - Yes Yes - Register
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select UK and click continue
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to register VAT MOSS page
    Then I will be redirected to /sso-sign-out?continueUrl=%2Fbusiness-account single sign on

  Scenario: Chosen Mini One Stop Shop IOM (MOSS) VAT option - Yes Yes - Register
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select Iom and click continue
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-MOSS-U-ORG Enrol page

  Scenario: Chosen Mini One Stop Shop Iom(MOSS) VAT option - Yes No - Register
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select Iom and click continue
    And I click Yes button and continue
    And I click No button and continue
    Then I should be redirected to moss-registration/org/provide-vat-details?lang=eng Portal page

  Scenario: Chosen Mini One Stop Shop (MOSS) VAT option - Yes No - Register
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select UK and click continue
    And I click Yes button and continue
    And I click No button and continue
    Then I will be redirected to register VAT first page
    And I click continue
    Then I will be redirected to emac HMCE-VATDEC-ORG Enrol page

  Scenario: Chosen Mini One Stop Shop (MOSS) VAT option - No - Register
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select UK and click continue
    And I click No button and continue
    Then I will be redirected to register Register for VAT page
    And I click continue
    Then I should be redirected to business-registration/introduction Portal page

  Scenario: Chosen Mini One Stop Shop IOM (MOSS) VAT option - No - Register
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select Iom and click continue
    And I click No button and continue
    Then I will be redirected to register Register for VAT page
    And I click continue
    And I should be redirected to Registering for VAT Gov page

  Scenario: Redirect enrolment for VAT MOSS outside the EU to EMAC - Yes
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select NonEu and click continue
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-MOSSNU-ORG Enrol page

  Scenario: Redirect enrolment for VAT MOSS outside the EU to EMAC - No
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select NonEu and click continue
    And I click No button and continue
    Then I should be redirected to moss-registration/org/introduction Portal page

  Scenario: Change VAT MOSS page within BTA to new assets template
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select EU and click continue
    Then I will be redirected to register Register in your home country page

  Scenario Outline: Chosen Mini One Stop Shop (MOSS) VAT option - No - Not now
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select <Country> and click continue
    And I click No button and continue
    Then I will be redirected to register Register for VAT page
    When I click on not-now link
    Then I should be redirected to the /business-account page

    Examples:
      |Country |
      |UK      |
      |Iom     |

  Scenario Outline: Chosen Mini One Stop Shop (MOSS) VAT option - Yes No - Not Now
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I select UK and click continue
    And I click <Choice1> button and continue
    And I click <Choice2> button and continue
    Then I will be redirected to register <Title> page
    When I click on not-now link
    Then I should be redirected to the /business-account page

    Examples:
      |Choice1   | Choice2   | Title         |
      |Yes       | Yes       | VAT MOSS      |
      |Yes       | No        | VAT first     |

  Scenario Outline: Choose EC Sales List / EU Refunds, Yes VAT registered
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select <Enrolment> and click continue
    And I click Yes button and continue
    Then I will be redirected to emac <Code> Enrol page

    Examples:
      |Enrolment | Code            |
      |ecsales   | HMCE-ECSL-ORG   |
      |eurefunds | HMRC-EU-REF-ORG |

  Scenario Outline: Choose EC Sales List / EU Refunds, No Not VAT registered
    Given I login as an Organisation with NO enrolments
    Then I navigate to the VAT page
    Then I select <Enrolment> and click continue
    And I click No button and continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

    Examples:
      |Enrolment |
      |ecsales   |
      |eurefunds |
      |rcsl      |

  Scenario Outline: Do not ask users with VAT enrolment "Is the business registered for VAT?"
    Given I login as an Organisation with VAT preset
    Then I navigate to the VAT page
    Then I select <Enrolment> and click continue
    Then I will be redirected to emac <Code> Enrol page

    Examples:
      |Enrolment | Code            |
      |ecsales   | HMCE-ECSL-ORG   |
      |eurefunds | HMRC-EU-REF-ORG |
      |rcsl      | HMCE-VATRSL-ORG |

  Scenario Outline: VAT MOSS journeys
    Given I login as an <Login> with NO enrolments
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I should be redirected to the <Page> page

    Examples:
      |Login        | Page                                          |
      |Individual   | /business-account/add-tax/vat/moss/newaccount |
      |Organisation | /business-account/add-tax/vat/moss            |
      |Agent        | /business-account/add-tax/vat/moss            |

  Scenario Outline: User NOT an Individual with VAT preset
    Given I login as an <Login> with VAT preset
    Then I navigate to the VAT page
    Then I select moss and click continue
    Then I should be redirected to the /business-account/add-tax/vat/moss-uk/vat-registered page

    Examples:
      |Login        |
      |Organisation |
      |Agent        |