@beacd
Feature: Create subcontractor journey for CIS

  Scenario Outline: Sole Trader or Partnership subcontractor, with SA or CT preset
    Given I login as an Organisation with <Preset> preset
    And I navigate to the cis/uk/subcontractor employer page
    Then I click on the <Type> enrolment
    And I click continue
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
    Then I click on the soleTrader enrolment
    And I click continue
    And I click Yes button and continue
    Then I click on the <Type> enrolment
    And I click continue
    Then I should be redirected to <Form> Gov page

    Examples:
      | Type      | Form                                 |
      | paidNet   | Register for payment under deduction |
      | paidGross | Register for gross payment           |

  Scenario: Sole Trader subcontractor NO enrolments, more than £30,000 turnover, click the 'check if you qualify for gross payments' link
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/subcontractor employer page
    Then I click on the soleTrader enrolment
    And I click continue
    And I click Yes button and continue
    And I click on CISNetOrGross link
    Then I should be redirected to What you must do as a Construction Industry Scheme (CIS) subcontractor Gov page

  Scenario: Sole Trader subcontractor NO enrolments, less than £30,000 turnover
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/subcontractor employer page
    Then I click on the soleTrader enrolment
    And I click continue
    And I click No button and continue
    Then I should be redirected to Register for gross payment Gov page

  Scenario Outline: Partnership or Limited Company subcontractor NO enrolments
    Given I login as an Organisation with NO enrolments
    And I navigate to the cis/uk/subcontractor employer page
    Then I click on the <Type> enrolment
    And I click continue
    Then I should be redirected to <Form> Gov page

    Examples:
      | Type           | Form                                         |
      | partnership    | Register your partnership as a subcontractor |
      | limitedCompany | Register your company                        |