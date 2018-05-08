@beacd

Feature: Other imports exports

    Background:
      Given I login as an Organisation with NO enrolments
      And I navigate to the import export page
@smoke
    Scenario: User goes to DDES for EMCS enrolment if they have DAN number
      Then I click on DDES the enrolment
      And I click continue
      And I click Yes button and continue
      Then I will be redirected to emac HMCE-DDES enrolments page
@smoke
    Scenario: User goes to DDES for EMCS enrolment if they do not have DAN number
      Then I click on DDES the enrolment
      And I click continue
      And I click No button and continue
      Then I will be redirected to register DAN page
      And I click continue
      Then I should be redirected to DAN GovUk page

    Scenario: User goes to emac for eBTI enrolment if they have EORI number
      Then I click on eBTI the enrolment
      And I click continue
      And I click Yes button and continue
      Then I will be redirected to emac HMCE-EBTI-ORG enrolments page

    Scenario: User goes to emac for eBTI enrolment if they have EORI number
      Then I click on eBTI the enrolment
      And I click continue
      And I click No button and continue
      Then I will be redirected to register EORI page
      And I click continue
      Then I should be redirected to EORI GovUk page

    Scenario: User goes to emac for EMCS enrolment if they have SEED number
      Then I click on EMCS the enrolment
      And I click continue
      And I click Yes button and continue
      Then I will be redirected to emac HMRC-EMCS-ORG enrolments page

    Scenario: User goes to emac for EMCS enrolment if they do not have SEED number
      Then I click on EMCS the enrolment
      And I click continue
      And I click No button and continue
      Then I will be redirected to register SEED page
      And I click continue
      Then I should be redirected to SEED GovUk page

    Scenario: User goes to emac for ICS enrolment if they have EORI number
      Then I click on ICS the enrolment
      And I click continue
      And I click Yes button and continue
      Then I will be redirected to emac HMRC-ICS-ORG enrolments page

    Scenario: User goes to emac for ICS enrolment if they have EORI number
      Then I click on ICS the enrolment
      And I click continue
      And I click No button and continue
      Then I will be redirected to register EORI page
      And I click continue
      Then I should be redirected to EORI GovUk page

    Scenario: User goes to emac for NCTS enrolment if they have EORI number
      Then I click on NCTS the enrolment
      And I click continue
      And I click Yes button and continue
      Then I will be redirected to emac HMRC-NCTS-ORG enrolments page

    Scenario: User goes to emac for NCTS enrolment if they have EORI number
      Then I click on NCTS the enrolment
      And I click continue
      And I click No button and continue
      Then I will be redirected to register EORI page
      And I click continue
      Then I should be redirected to EORI GovUk page

    Scenario: User goes to emac for NES enrolment if they have EORI number
      Then I click on NES the enrolment
      And I click continue
      And I click Yes button and continue
      Then I click Yes button and continue
      Then I will be redirected to emac HMCE-NES enrolments page

    Scenario: User goes to CHIEF register for NES if they don't have CHIEF role
      Then I click on NES the enrolment
      And I click continue
      And I click Yes button and continue
      Then I click No button and continue
      Then I will be redirected to register CHIEF page

    Scenario: User goes to Get an EORI number if they do not have an EORI number
      Then I click on NES the enrolment
      And I click continue
      And I click No button and continue
      Then I click Yes button and continue
      And I click continue
      Then I should be redirected to EORI GovUk page

    Scenario: User goes to Get an EORI number if they do not have an EORI and they do not have a CHIEF role
      Then I click on NES the enrolment
      And I click continue
      And I click No button and continue
      Then I click No button and continue
      And I click on eori-request-form link
      Then I should be redirected to EORI GovUk page