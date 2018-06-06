@beacd
Feature: Construction Industry Team

  Scenario: Users adding CIS not registered
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/contractor employer page
    And I click No button and continue
    Then I will be redirected to register PAYE page
    And I click continue
    Then I should be redirected to business-registration/introduction?lang=eng Portal page

  Scenario: Users adding CIS not registered not now
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/contractor employer page
    And I click No button and continue
    Then I will be redirected to register PAYE page
    When I click on not-now link
    Then I should be redirected to the /business-account page

  Scenario: Users adding CIS registered sign in
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/contractor employer page
    And I click Yes button and continue
    And I click Yes button and continue
    Then I will be redirected to /sso-sign-out?continueUrl=%2Fbusiness-account single sign on

  Scenario: Users adding CIS registered add CIS
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/contractor employer page
    And I click Yes button and continue
    And I click Yes button and continue
    When I click on add-to-this-account link
    Then I will be redirected to emac HMRC-CIS-ORG enrolments page
    
  Scenario Outline: Sole Trader or Partnership subcontractor, with SA or CT preset
    Given I login as an Organisation with <Preset> preset
    And I navigate to the cis/uk/subcontractor employer page
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
    And I navigate to the cis/uk/subcontractor employer page
    Then I select soleTrader and click continue
    And I click Yes button and continue
    Then I select <Type> and click continue
    Then I should be redirected to <Form> Gov page

    Examples:
      | Type      | Form                                 |
      | paidNet   | Register for payment under deduction |
      | paidGross | Register for gross payment           |

  Scenario: Sole Trader subcontractor NO enrolments, more than £30,000 turnover, click the 'check if you qualify for gross payments' link
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/subcontractor employer page
    Then I select soleTrader and click continue
    And I click Yes button and continue
    And I click on CISNetOrGross link
    Then I should be redirected to What you must do as a Construction Industry Scheme (CIS) subcontractor Gov page

  Scenario: Sole Trader subcontractor NO enrolments, less than £30,000 turnover
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/subcontractor employer page
    Then I select soleTrader and click continue
    And I click No button and continue
    Then I should be redirected to Register for gross payment Gov page

  Scenario Outline: Partnership or Limited Company subcontractor NO enrolments
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/subcontractor employer page
    Then I select <Type> and click continue
    Then I should be redirected to <Form> Gov page

    Examples:
      | Type           | Form                                         |
      | partnership    | Register your partnership as a subcontractor |
      | limitedCompany | Register your company                        |

  Scenario: New design and navigation for contractor or subcontractor page NO enrolments, not based in the UK
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis employer page
    And I click No button and continue
    Then I should be redirected to Construction Industry Scheme: businesses based outside UK Gov page

  Scenario: New design and navigation for contractor or subcontractor page EPAYE preset, not based in the UK
    Given I login as an Organisation with EPAYE preset
    And I navigate to the cis employer page
    And I click No button and continue
    Then I should be redirected to Construction Industry Scheme: businesses based outside UK Gov page

  Scenario Outline: New design and navigation for contractor or subcontractor page NO enrolments, based in the UK, Contractor or Subcontractor
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis employer page
    And I click Yes button and continue
    Then I select <Choice> and click continue
    Then I should be redirected to the <Page> page

    Examples:
      | Choice        | Page                                                    |
      | Contractor    | /business-account/add-tax/employer/cis/uk/contractor    |
      | Subcontractor | /business-account/add-tax/employer/cis/uk/subcontractor |

  Scenario: New design and navigation for contractor or subcontractor page EPAYE preset, based in the UK, Contractor
    Given I login as an Organisation with EPAYE preset
    And I navigate to the cis employer page
    And I click Yes button and continue
    Then I select Contractor and click continue
    Then I should be redirected to service/construction-ind-scheme?action=enrol&step=enterdetails&lang=eng Portal page