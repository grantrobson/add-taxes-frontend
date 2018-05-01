package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import org.junit.Assert.assertTrue
import org.openqa.selenium.By
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage._

class BaseStepDef extends ScalaDsl with EN {

    And("""^The user refreshes the page$""") { () =>
      pageRefresh()
    }

    And("""^the (Continue|Submit) button is clicked$""") { () =>
      clickContinue()
    }

    Then("""^the browser is shutdown$""") { () =>
      ShutdownTest()
    }

    When("""^I login as an (Organisation|Individual) with NO enrolments$""") { (affinityGroup: String) =>
      navigateToStartPage()
      loginWithNoEnrolments(affinityGroup)
    }


    When("""^I will be on the Add taxes page$""") { () =>
      assertTrue(driver.getCurrentUrl.equals(loginRedirectUrl))
    }

    When("""^I navigate to (.*) enrolments page$""") { (enrolment: String) =>
      navigateToAddTaxesUrl(enrolment)
    }

    Then("""^I will be redirected to emac (.*) enrolments page$""") {(enrolment: String) =>
      navigateToEmacUrl(enrolment)
    }

    Then("""^I will be redirected to register (.*) page$""") { (registerNumber: String) =>
      registerNumber match {
        case "EORI" => driver.getCurrentUrl should include ("/other/import-export/ics/register")
        case "SEED" => driver.getCurrentUrl should include ("/other/import-export/emcs/register")
        case "DAN" => driver.getCurrentUrl should include ("/other/import-export/ddes/register")
      }
    }

    And("""^I click continue$"""){ () =>
      waitForElement(By.className("button")).click()
    }

    Then("""^I should be redirected to (.*) GovUk page$""") { (url: String) =>
      url match {
        case "EORI" =>  driver.getCurrentUrl shouldBe "https://www.gov.uk/eori#how-to-get-an-eori-number"
        case "SEED" => driver.getCurrentUrl shouldBe "https://www.gov.uk/guidance/excise-movement-and-control-system-how-to-register-and-use#register-and-enrol"
        case "DAN" => driver.getCurrentUrl shouldBe "https://www.gov.uk/government/publications/notice-101-deferring-duty-vat-and-other-charges" +
                                                    "/notice-101-deferring-duty-vat-and-other-charges#deferment-approval"
      }
    }

  }
