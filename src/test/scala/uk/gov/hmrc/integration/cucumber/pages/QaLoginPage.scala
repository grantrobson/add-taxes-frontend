package uk.gov.hmrc.integration.cucumber.pages

import org.openqa.selenium.firefox.FirefoxDriver
import uk.gov.hmrc.integration.cucumber.utils.driver.Driver
import uk.gov.hmrc.integration.cucumber.utils.methods.Input
import uk.gov.hmrc.integration.cucumber.utils.methods.Wait.{waitForElement, waitForPageToChange}

object QaLoginPage extends BasePage {

  override val url = s"$basePageUrl/gg/sign-in?continue=/business-account"
  override val header = "Sign in"

  val userId = "813383820636"
  val password = "Hmrc1234"

  def loginToQa = {
    navigateToStart
    enterLoginDetails
    clickSubmit
  }

  private def navigateToStart = driver.navigate().to(url)

  private def enterLoginDetails = {
    Input.sendKeysById("userId", userId)
    Input.sendKeysById("password", password)
  }

  private def clickSubmit: Unit = {
    waitForElement("signin").click()
    Driver.webDriver match {
      case _: FirefoxDriver =>
        waitForPageToChange
      case _  =>
    }
  }
}
