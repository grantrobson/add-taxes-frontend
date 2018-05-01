package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage.clickOnContinue
import uk.gov.hmrc.integration.cucumber.pages.DDESPage


class DDESStepDef extends ScalaDsl with EN {

  And("""^I select (Yes|No) for DAN number and continue$""") { (option: String) =>
    option match {
      case "Yes" => DDESPage.clickYes
      case "No" => DDESPage.clickNo
    }
    clickOnContinue()
  }

}
