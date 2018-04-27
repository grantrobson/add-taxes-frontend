package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage._
import uk.gov.hmrc.integration.cucumber.pages.ICSPage

class ICSStepDef extends ScalaDsl with EN {

  When("""^I navigate to (.*) enrolments page$""") { (enrolment: String) =>
    navigateToAddTaxesUrl(enrolment)
  }

  And("""^I select (Yes|No) having an EORI number and continue$""") { (option: String) =>
    option match {
      case "Yes" => ICSPage.clickYes
      case "No" => ICSPage.clickNo
    }
    clickOnContinue()
  }

  Then("""^I will be redirected to emac (.*) enrolments page$""") {(enrolment: String) =>
    navigateToEmacUrl(enrolment)
  }



}
