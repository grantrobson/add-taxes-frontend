package uk.gov.hmrc.integration.cucumber.utils.methods

import java.util.concurrent.TimeUnit

import org.openqa.selenium.{By, WebDriver, WebElement}
import org.openqa.selenium.support.ui.{ExpectedConditions, FluentWait}
import uk.gov.hmrc.integration.cucumber.pages.BasePage
import uk.gov.hmrc.integration.cucumber.utils.methods.Find._

object Wait extends BasePage {

  val url = ""
  val header = ""

  def fluentWait: FluentWait[WebDriver] = new FluentWait[WebDriver](driver)
    .withTimeout(20, TimeUnit.SECONDS)
    .pollingEvery(250, TimeUnit.MILLISECONDS)
    .ignoring(classOf[org.openqa.selenium.NoSuchElementException])

  def waitForElement(id: String): WebElement = waitForElement(By.id(id))

  def waitForElement(by: By): WebElement = fluentWait.until(ExpectedConditions.presenceOfElementLocated(by))

  def waitForPageToChange =
    fluentWait.until(ExpectedConditions.stalenessOf(find(By.cssSelector("html"))))
}
