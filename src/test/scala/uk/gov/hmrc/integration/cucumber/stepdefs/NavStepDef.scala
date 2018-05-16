package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.utils.methods.Nav


class NavStepDef extends ScalaDsl with EN {

  When("""^I navigate to the (.*) other page$""") { (enrolment: String) =>
    Nav.navigateToAddTaxesOtherUrl(enrolment)
  }

  When("""^I navigate to the (.*) employer page$""") { (enrolment: String) =>
    Nav.navigateToAddTaxesEmployerUrl(enrolment)
  }

  When("""^I navigate to the self assessment page$""") { ()  =>
    Nav.navigateToAddTaxesSAUrl
  }
}
