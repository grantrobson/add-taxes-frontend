@beacd
Feature: Construction Industry Team

  Scenario: New design nav for PAYE for employers PAYE & ERS to CIS
    Given I login as an Organisation with EPAYE preset
    And I navigate to the employer page
    Then I select cis and click continue
    Then I should be redirected to the business-account/add-tax/employer/cis page
@zap
  Scenario: New design nav for PAYE for employers PAYE & ERS to Pension
    Given I login as an Organisation with EPAYE preset
    And I navigate to the employer page
    Then I select pension and click continue
    Then I should be redirected to service/pensions-practitioners?action=enrol&step=hasid&lang=eng Portal page

  Scenario: Users adding CIS not registered
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Contractor and click continue
    And I click No button and continue
    Then I will be redirected to register PAYE page
    And I click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: Users adding CIS not registered not now
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Contractor and click continue
    And I click No button and continue
    Then I will be redirected to register PAYE page
    When I click on not-now link
    Then I should be redirected to the /business-account page
@zap
  Scenario: Users adding CIS registered sign in
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Contractor and click continue
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to /sso-sign-out?continueUrl=%2Fbusiness-account single sign on

  Scenario: Users adding CIS registered add CIS
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Contractor and click continue
    And I click Yes button and continue
    And I click Yes button and continue
    When I click on add-to-this-account link
    Then I will be redirected to emac HMRC-CIS-ORG Enrol page

  Scenario: Sole Trader subcontractor NO enrolments, more than £30,000 turnover, click the 'check if you qualify for gross payments' link
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Subcontractor and click continue
    Then I select soleTrader and click continue
    And I click Yes button and continue
    And I click on CISNetOrGross link
    Then I should be redirected to What you must do as a Construction Industry Scheme (CIS) subcontractor Gov page

  Scenario: Sole Trader subcontractor NO enrolments, less than £30,000 turnover
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Subcontractor and click continue
    Then I select soleTrader and click continue
    And I click No button and continue
    Then I should be redirected to Register for gross payment Gov page

  Scenario: New design and navigation for contractor or subcontractor page EPAYE preset, based in the UK, Contractor
    Given I login as an Organisation with EPAYE preset
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Contractor and click continue
    Then I will be redirected to emac HMRC-CIS-ORG Enrol page

  Scenario: New design nav for PAYE for employers with no enrolments
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select epaye and click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: Employment intermediaries Agent goes to not-enrolled
    Given I login as an Agent with EPAYE preset
    And I navigate to the employer page
    Then I select intermediaries and click continue
    Then I should be redirected to the /employment-intermediary-report/not-enrolled page

  Scenario: Yes, Yes, Sign In
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select ers and click continue
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to register Add employment related securities (ERS) to the account you use for PAYE for employers page
    And I click continue
    Then I should be redirected to the ?continue=/business-account page

  Scenario: Yes, No, Register
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select ers and click continue
    And I click Yes button and continue
    And I click No button and continue
    Then I will be redirected to register You need to manage PAYE for employers online before you add this scheme page
    And I click continue
    Then I will be redirected to emac IR-PAYE Enrol page

  Scenario: No, Register
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select ers and click continue
    And I click No button and continue
    Then I will be redirected to register Register for PAYE page
    And I click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: No, Not Now
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select ers and click continue
    And I click No button and continue
    Then I will be redirected to register Register for PAYE page
    When I click on not-now link
    Then I should be redirected to the /business-account page

  Scenario: Yes, Yes, Sign in
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select intermediaries and click continue
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to register Add employment intermediaries to the account you use for PAYE for employers page
    And I click continue
    Then I should be redirected to the ?continue=/business-account page

  Scenario: Yes, Yes, I want to add intermediaries
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select intermediaries and click continue
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to register Add employment intermediaries to the account you use for PAYE for employers page
    And I click on sign-in link
    Then I should be redirected to the /employment-intermediary-report/not-enrolled page

  Scenario: Yes, No, I want to add intermediaries
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select intermediaries and click continue
    And I click Yes button and continue
    And I click No button and continue
    Then I should be redirected to the /employment-intermediary-report/not-enrolled page

  Scenario: No, register
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select intermediaries and click continue
    And I click No button and continue
    And I click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: No, not now
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select intermediaries and click continue
    And I click No button and continue
    And I click on not-now link
    Then I should be redirected to the /business-account page
@solo
  Scenario: Update pensions journey
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select pension and click continue
    And I click No button and continue
    And I click continue
    Then I should be redirected to the pensionschemes.hmrc.gov.uk/pso/reg/registeruserinitialquestions.aspx page
  @solo
  Scenario: Update pensions journey
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select pension and click continue
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to emac HMRC-PP-ORG Enrol page
  @solo
  Scenario: Update pensions journey
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select pension and click continue
    And I click Yes button and continue
    And I click No button and continue
    And I click continue
    Then I will be redirected to emac HMRC-PP-ORG Enrol page


  Scenario Outline: Sole Trader or Partnership subcontractor, with SA or CT preset
    Given I login as an Organisation with <Preset> preset
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Subcontractor and click continue
    Then I select <Type> and click continue
    Then I should be redirected to the <Form> page

    Examples:
      | Preset | Type        | Form                                                                   |
      | SA     | soleTrader  | /forms/form/CIS301302/start#1                                          |
      | CT     | soleTrader  | /forms/form/CIS301302/start#1                                          |
      | SA     | partnership | /forms/form/Construction-Industry-Scheme-register-your-partnership/new |
      | CT     | partnership | /forms/form/Construction-Industry-Scheme-register-your-partnership/new |

  Scenario Outline: Sole Trader subcontractor NO enrolments, more than £30,000 turnover, paid NET or GROSS
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Subcontractor and click continue
    Then I select soleTrader and click continue
    And I click Yes button and continue
    Then I select <Type> and click continue
    Then I should be redirected to <Form> Gov page

    Examples:
      | Type      | Form                                 |
      | paidNet   | Register for payment under deduction |
      | paidGross | Register for gross payment           |

  Scenario Outline: Partnership or Limited Company subcontractor NO enrolments
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select Subcontractor and click continue
    Then I select <Type> and click continue
    Then I should be redirected to <Form> Gov page

    Examples:
      | Type           | Form                                         |
      | partnership    | Register your partnership as a subcontractor |
      | limitedCompany | Register your company                        |

  Scenario Outline: New design and navigation for contractor or subcontractor page NO enrolments and PAYE, not based in the UK
    Given I login as an Organisation with <Preset>
    And I navigate to the employer page
    Then I select cis and click continue
    And I click No button and continue
    Then I should be redirected to Construction Industry Scheme: businesses based outside UK Gov page
    Examples:
      | Preset        |
      | NO enrolments |
      | EPAYE preset  |

  Scenario Outline: New design and navigation for contractor or subcontractor page NO enrolments, based in the UK, Contractor or Subcontractor
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select cis and click continue
    And I click Yes button and continue
    Then I select <Choice> and click continue
    Then I should be redirected to the <Page> page

    Examples:
      | Choice        | Page                                                    |
      | Contractor    | /business-account/add-tax/employer/cis/uk/contractor    |
      | Subcontractor | /business-account/add-tax/employer/cis/uk/subcontractor |

  Scenario Outline: New design nav for PAYE for employers PAYE & ERS
    Given I login as an Organisation with <Preset>
    And I navigate to the employer page
    Then I select <Enrolments> and click continue
    Then I should be redirected to <Page> Portal page

    Examples:
      | Preset        | Enrolments | Page                                        |
      | NO enrolments | epaye      | business-registration/introduction?lang=eng |
      | EPAYE preset  | ers        | ers/org///add-scheme?lang=eng               |

  Scenario Outline: Yes, Yes, Not Now & Yes, No, Not Now journeys
    Given I login as an Organisation with NO enrolments
    And I navigate to the employer page
    Then I select ers and click continue
    And I click Yes button and continue
    And I click <Choice> button and continue
    Then I will be redirected to register <Title> page
    When I click on not-now link
    Then I should be redirected to the /business-account page

    Examples:
      | Choice  | Title                                                                                 |
      | Yes     | Add employment related securities (ERS) to the account you use for PAYE for employers |
      | No      | You need to manage PAYE for employers online before you add this scheme               |