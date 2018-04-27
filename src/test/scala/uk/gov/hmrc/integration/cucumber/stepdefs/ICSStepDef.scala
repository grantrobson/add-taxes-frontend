package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import org.openqa.selenium.By
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage._
import uk.gov.hmrc.integration.cucumber.pages.ICSPage

class ICSStepDef extends ScalaDsl with EN {

  And("""^I select (Yes|No) for an EORI number and continue$""") { (option: String) =>
    option match {
      case "Yes" => ICSPage.clickYes
      case "No" => ICSPage.clickNo
    }
    clickOnContinue()
  }
}
