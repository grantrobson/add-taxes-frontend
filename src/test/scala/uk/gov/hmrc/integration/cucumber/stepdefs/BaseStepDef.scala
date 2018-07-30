package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import uk.gov.hmrc.integration.cucumber.utils.methods.Input._

class BaseStepDef extends ScalaDsl with EN {

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

    When("""^I select (.*) and click continue$""") { (enrolment: String) =>
      clickEnrolmentsLink(enrolment)
      clickOnContinue()
    }

    And("""^I click continue$"""){ () =>
      clickContinue()
    }

    And("""^I click submit"""){ () =>
      clickSubmit()
    }

    And("""^I enter (.*) in the (.*) element and click submit"""){ (value: String, id: String) =>
      sendKeysById(id, value)
      clickSubmit()
    }

}