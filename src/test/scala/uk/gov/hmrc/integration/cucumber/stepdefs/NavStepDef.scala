package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.utils.methods.Nav


class NavStepDef extends ScalaDsl with EN {

  When("""^I navigate to the VAT page$""") { () =>
    Nav.navigateToAddTaxesVATUrl
  }

  When("""^I navigate to the other page$""") { () =>
    Nav.navigateToAddTaxesOtherUrl
  }

  When("""^I navigate to the employer page$""") { () =>
    Nav.navigateToAddTaxesEmployerUrl
  }

  When("""^I navigate to the self assessment page$""") { ()  =>
    Nav.navigateToAddTaxesSAUrl
  }

  When("""^I navigate to the (BTA|AT) (.*) URL""") { (service: String, navPage: String)  =>
    Nav.navigateTo(service, navPage)
  }

  When("""^I navigate to the (.*), (.*) how to stop page$""") { (url: String, url2: String) =>
    Nav.navigateToHowToStop(url, url2)
  }
}