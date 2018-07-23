package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage._
import uk.gov.hmrc.integration.cucumber.pages.QaLoginPage._

class LoginStepDef extends ScalaDsl with EN  {

  When("""^I login as an (Organisation|Individual|Agent) with NO enrolments$""") { (affinityGroup: String) =>
    navigateToStartPage()
    loginWithNoEnrolments(affinityGroup)
  }

  When("""^I login as an (Organisation|Individual|Agent) with (.*) preset$""") { (affinityGroup: String, preset: String) =>
    navigateToStartPage()
    loginWithPreset(affinityGroup, preset)
  }

  When("""^I login as an (Organisation|Individual|Agent) with (.*) enrolled$""") { (affinityGroup: String, enrolments: String) =>
    navigateToStartPage()
    loginWithEnrolmentsActive(affinityGroup, enrolments)
    }

  When("""^I login to QA$""") { () =>
  loginToQa
  }
}