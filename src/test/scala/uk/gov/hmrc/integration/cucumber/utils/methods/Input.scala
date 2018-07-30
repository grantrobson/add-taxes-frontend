package uk.gov.hmrc.integration.cucumber.utils.methods

import org.openqa.selenium.By
import org.openqa.selenium.chrome.ChromeDriver
import org.openqa.selenium.support.ui.Select
import uk.gov.hmrc.integration.cucumber.pages.BasePage
import uk.gov.hmrc.integration.cucumber.utils.driver.Driver
import uk.gov.hmrc.integration.cucumber.utils.methods.Find._
import uk.gov.hmrc.integration.cucumber.utils.methods.Wait.{waitForElement, waitForPageToChange}

object Input extends BasePage {

  val url = ""
  val header = ""

  def clickById(id: String) = findById(id).click()
  def clickByName(id: String, num: Int) = findByName(id).get(num).click()
  def clickByClass(id: String, num: Int) = findByClass(id).get(num).click()
  def clickByCSS(css: String) = find(By.cssSelector(css)).click()
  def clickContinue() = waitForElement(By.className("button")).click()
  def clickEnrolmentsLink(enrolment: String) = clickByCSS(s"[value=$enrolment]")
  def clickNo =  clickByCSS("[value=no], [value=No]")
  def clickYes = clickByCSS("[value=yes], [value=Yes]")
  def clickSubmit() = waitForElement(By.className("button")).submit()

  def clickOnContinue(): Unit = {
    waitForElement("continue-button").submit()
    Driver.webDriver match {
      case _: ChromeDriver =>
      case _ =>
        waitForPageToChange
    }
  }

   def sendKeysById(id: String, value: String) = {
    findById(id).clear()
    findById(id).sendKeys(value)
  }

  def sendNCharactersById(id: String, n: Int, char: String = "a") = {
    findById(id).clear()
    findById(id).sendKeys(char * n)
  }

  def sendKeysByName(id: String, value: String, index: Int = 0) = {
    findByName(id).clear()
    findByName(id).get(index).sendKeys(value)
  }
}
