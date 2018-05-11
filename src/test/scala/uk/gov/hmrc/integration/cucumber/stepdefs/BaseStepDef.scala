package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.utils.methods.Check.{be, driver}
import uk.gov.hmrc.integration.cucumber.utils.methods.{Check, Nav}
import uk.gov.hmrc.integration.cucumber.utils.methods.Input._

class BaseStepDef extends ScalaDsl with EN {

    And("""^The user refreshes the page$""") { () =>
      pageRefresh()
    }

    And("""^I click (Yes|No) button and continue$""") { (id: String) =>
      id match {
        case "Yes" => clickYes
        case "No" => clickNo
      }

      clickOnContinue()
    }

    And("""^I click on (.*) link$""") { (id: String) =>
      clickById(id)
    }

    When("""^I click on the (.*) enrolment$""") { (enrolment: String) =>
      clickEnrolmentsLink(enrolment)
    }

    Then("""^I will be redirected to emac (.*) enrolments page$""") { (enrolment: String) =>
      Check.assertEmacUrl(enrolment)
    }

    Then("""^I will be redirected to register (.*) page$""") { (registerType: String) =>
      Check.assertRegisterPage(registerType)
    }

    And("""^I click continue$"""){ () =>
      clickContinue()
    }

    And("""^I click submit"""){ () =>
      clickSubmit()
    }

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
}