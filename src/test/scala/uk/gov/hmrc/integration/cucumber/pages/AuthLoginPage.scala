package uk.gov.hmrc.integration.cucumber.pages

import org.openqa.selenium.By
import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.support.ui.Select
import uk.gov.hmrc.integration.cucumber.utils.driver.Driver


object AuthLoginPage extends BasePage {

  override val url: String = basePageUrl
  override val header: String = ""

  def navigateToStartPage(): Unit = {
    navigateTo(url)
  }

  def loginWithNoEnrolments(affinityGroup: String): Unit = {
    enterRedirectUrl()
    selectAffinityGroup(affinityGroup)
    clickOnSubmit()
  }

  def enterRedirectUrl() {
    val redirectUrlField = By.name("redirectionUrl")
    driver.findElement(redirectUrlField).clear()
    driver.findElement(redirectUrlField).sendKeys(loginRedirectUrl)
  }

  def selectAffinityGroup(affinityGroup: String) {
    val selectLevel: Select = new Select(driver.findElement(By.name("affinityGroup")))
    selectLevel.selectByVisibleText(affinityGroup)
  }

  def clickOnSubmit(): Unit = {
    waitForElement("inputForm").submit()
    Driver.webDriver match {
      case _: ChromeDriver =>
      case _ =>
        waitForPageToChange
    }
  }
}