package uk.gov.hmrc.integration.cucumber.utils.methods

import org.openqa.selenium.{By, WebElement}
import org.openqa.selenium.support.ui.ExpectedConditions
import uk.gov.hmrc.integration.cucumber.pages.BasePage
import uk.gov.hmrc.integration.cucumber.utils.methods.Wait.fluentWait

object Find extends BasePage {

  val url = ""
  val header = ""

  def find(by: By): WebElement = {
    fluentWait.until(ExpectedConditions.presenceOfElementLocated(by))
    driver.findElement(by)
  }

  def findByClass(className: String) = findElements(By.className(className))
  def findByCSS(css: String) = find(By.cssSelector(css))
  def findById(id: String) = find(By.id(id))
  def findByName(id: String) = findElements(By.name(id))

  def findElements(by: By) = {
    fluentWait.until(ExpectedConditions.presenceOfElementLocated(by))
    driver.findElements(by)
  }

  def findH1() = findByCSS("h1")
  def getTextById(id: String) = findById(id).getText
}
