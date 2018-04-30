package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage._
import uk.gov.hmrc.integration.cucumber.pages.{EMCSPage, ICSPage}

class EMCSStepDef extends ScalaDsl with EN {

  And("""^I select (Yes|No) for SEED number and continue$""") { (option: String) =>
    option match {
      case "Yes" => EMCSPage.clickYes
      case "No" => EMCSPage.clickNo
    }
    clickOnContinue()
  }
}
