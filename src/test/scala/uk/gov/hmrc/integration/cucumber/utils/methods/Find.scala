package uk.gov.hmrc.integration.cucumber.utils.methods

import org.openqa.selenium.By
import org.openqa.selenium.support.ui.ExpectedConditions
import uk.gov.hmrc.integration.cucumber.pages.BasePage
import uk.gov.hmrc.integration.cucumber.utils.methods.Wait.fluentWait

object Find extends BasePage {

  val url = ""
  val header = ""

  def getTextById(id: String) = findById(id).getText


  def find(by: By) = {
    fluentWait.until(ExpectedConditions.presenceOfElementLocated(by))
    driver.findElement(by)
  }
  def findById(id: String) = find(By.id(id))

  def findElements(by: By) = {
    fluentWait.until(ExpectedConditions.presenceOfElementLocated(by))
    driver.findElements(by)
  }

  def findByName(id: String) = findElements(By.name(id))
  def findByClass(className: String) = findElements(By.className(className))
  def findByCSS(css: String) = find(By.cssSelector(css))

  def findH1() = findByCSS("h1")
}
