package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
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

      clickContinue()
    }

    And("""^I click on (.*) link$""") { (id: String) =>
      clickById(id)
    }

    When("""^I click on the (.*) enrolment$""") { (enrolment: String) =>
      clickEnrolmentsLink(enrolment)
    }

    And("""^I click continue$"""){ () =>
      clickContinue()
    }

    And("""^I click submit"""){ () =>
      clickSubmit()
    }
}