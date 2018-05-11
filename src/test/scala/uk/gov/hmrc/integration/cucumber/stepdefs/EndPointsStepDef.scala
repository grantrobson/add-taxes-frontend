package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.utils.methods.Check
import uk.gov.hmrc.integration.cucumber.utils.methods.Input._

class EndPointsStepDef extends ScalaDsl with EN {


  Then("""^I should be redirected to (.*) GovUk page$""") { (url: String) =>
    Check.assertGovUk(url)
  }

  Then("""^I should be redirected to (.*) Portal page$""") { (enrolment: String) =>
    Check.assertPortalPage(enrolment)
  }

  Then("""^I should be redirected to the (.*) page$""") { (enrolment: String) =>
    Check.checkUrlEnd(enrolment)
  }

  Then("""^I will be redirected to HMCE page$""") { () =>
    driver.getCurrentUrl should be("https://secure.hmce.gov.uk/ecom/is2/static/is2.html")
  }

  Then("""^I will be redirected to (.*) pdf$""") { (form: String) =>
    driver.getCurrentUrl should startWith("https://assets.publishing.service.gov.uk")
    driver.getCurrentUrl should include(form)
  }

  Then("""^I will be redirected to emac (.*) enrolments page$""") { (enrolment: String) =>
    Check.assertEmacUrl(enrolment)
  }

  Then("""^I will be redirected to register (.*) page$""") { (registerType: String) =>
    Check.assertRegisterPage(registerType)
  }

}
