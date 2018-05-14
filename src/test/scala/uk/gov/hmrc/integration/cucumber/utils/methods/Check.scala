package uk.gov.hmrc.integration.cucumber.utils.methods

import cucumber.api.DataTable
import org.junit.Assert
import org.openqa.selenium.By
import org.openqa.selenium.support.ui.ExpectedConditions
import uk.gov.hmrc.integration.cucumber.pages.BasePage
import uk.gov.hmrc.integration.cucumber.utils.methods.Find._
import uk.gov.hmrc.integration.cucumber.utils.methods.Input.{driver, include, _}
import uk.gov.hmrc.integration.cucumber.utils.methods.Wait.fluentWait

object Check extends BasePage {

  val url = ""
  val header = ""
  val emacUrl = "enrolment-management-frontend/ENROLMENT_TYPE/request-access-tax-scheme?continue=%2Fbusiness-account"

  def checkUrlEnd(enrolment: String) = driver.getCurrentUrl endsWith(s"s$enrolment")

  def assertPdfFile(pdf: String) = {
    driver.getTitle should include(pdf)
  }
  def assertEmacUrl(enrolment: String) = driver.getCurrentUrl should include (emacUrl.replace("ENROLMENT_TYPE", s"$enrolment"))
  def assertRegisterPage(registerType:String) = findH1().getText should include(registerType)
  def assertPortalPage(enrolment: String) = driver.getCurrentUrl should include(s"localhost:8080/portal/$enrolment")
  def assertGovUk(enrolment: String) = {
    driver.getCurrentUrl should startWith("https://www.gov.uk")
    findH1().getText should include(enrolment)
  }

  def checkErrorMessage(field: String, msg: String) = verifyTextUsingElementId(field + "-error-summary", msg)

  def verifyTextUsingElementId(elementId: String, expectedValue: String)= findById(elementId).getText shouldBe expectedValue
  def verifyInputUsingElementId(elementId: String, expectedValue: String)= findById(elementId).getAttribute("value") shouldBe expectedValue
  def verifyHyperlink(linkText: String) = findByCSS("a[title*=\"" + linkText + "\"]")
  def verifyHyperlinkTarget(id: String, target: String) = Assert.assertEquals(findById(id).getAttribute("href"), basePageUrl+"/"+target)

  def checkPageHeading(text: String) = {
    fluentWait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("h1")))
    findH1().getText shouldBe text
  }

  def validateText(id: String, value: String) = getTextById(id) shouldBe value
  val enterDataTable = iterate(sendKeysById) _
  val checkDataTable = iterate(validateText) _

  private def iterate(f: (String, String) => Any)(data: DataTable) = {
    val row = data.asMaps(classOf[String], classOf[String]).iterator
    while (row.hasNext) {
      val map = row.next
      val data = map.get("value")
      val loc = map.get("key")
      f(loc, data)
    }
  }

  def isElementVisible(id: String): Boolean = findById(id).isDisplayed

}