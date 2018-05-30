package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage.{loginWithNoEnrolments, navigateToStartPage, loginWithPreset}

class AuthLoginStepDef extends ScalaDsl with EN  {

  When("""^I login as an (Organisation|Individual) with NO enrolments$""") { (affinityGroup: String) =>
    navigateToStartPage()
    loginWithNoEnrolments(affinityGroup)
  }

  When("""^I login as an (Organisation|Individual) with (.*) preset$""") { (affinityGroup: String, preset: String) =>
    navigateToStartPage()
    loginWithPreset(affinityGroup, preset)
  }

}