package uk.gov.hmrc.integration.cucumber.stepdefs

import cucumber.api.scala.{EN, ScalaDsl}
import org.junit.Assert.assertTrue
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

}
