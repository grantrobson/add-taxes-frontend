@beacd

Feature: Enrolment of Child Trust Fund Provider

  Background:
    Given I login as an Organisation with NO enrolments
    And I navigate to the other page
    Then I select childTrustFund and click continue


  Scenario: is an approved Child Trust Fund Provider
    And I click Yes button and continue
    Then I will be redirected to emac IR-CTF Enrol page

  Scenario: User is not an approved Child Trust Fund Provider
    And I click No button and continue
    And I click continue
    And I should be redirected to CTF11 Gov page