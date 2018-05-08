package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import org.openqa.selenium.By
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage._

class BaseStepDef extends ScalaDsl with EN {

    And("""^The user refreshes the page$""") { () =>
      pageRefresh()
    }

    And("""^the (Continue|Submit) button is clicked$""") { () =>
      clickContinue()
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

    When("""^I login as an (Organisation|Individual) with NO enrolments$""") { (affinityGroup: String) =>
      navigateToStartPage()
      loginWithNoEnrolments(affinityGroup)
    }

    When("""^I navigate to the import export page$""") { () =>
      navigateToAddTaxesUrl
    }

    When("""^I click on the (.*) enrolment$""") { (enrolment: String) =>
      clickEnrollmentsLink(enrolment)
    }

    Then("""^I will be redirected to emac (.*) enrolments page$""") { (enrolment: String) =>
      navigateToEmacUrl(enrolment)
    }

    Then("""^I will be redirected to register (.*) page$""") { (registerType: String) =>
      assertRegisterPage(registerType)
    }

    And("""^I click continue$"""){ () =>
      waitForElement(By.className("button")).click()
    }

    Then("""^I should be redirected to (.*) GovUk page$""") { (url: String) =>
      url match {
        case "EORI" => driver.getCurrentUrl shouldBe "https://www.gov.uk/eori#how-to-get-an-eori-number"
        case "SEED" => driver.getCurrentUrl shouldBe "https://www.gov.uk/guidance/excise-movement-and-control-system-how-to-register-and-use#register-and-enrol"
        case "DAN" => driver.getCurrentUrl shouldBe "https://www.gov.uk/government/publications/notice-101-deferring-duty-vat-and-other-charges" +
          "/notice-101-deferring-duty-vat-and-other-charges#deferment-approval"
      }
    }
}