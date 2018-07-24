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
  val emacEnrolUrl   = "enrolment-management-frontend/ENROLMENT_TYPE/request-access-tax-scheme?continue=%2Fbusiness-account"
  val emacDeenrolUrl = "enrolment-management-frontend/ENROLMENT_TYPE/remove-access-tax-scheme?continue=%2Fbusiness-account"

  def assertEmacUrl(enrolment: String, status: String) = {
    status match {
      case "Enrol" => driver.getCurrentUrl should include(emacEnrolUrl.replace("ENROLMENT_TYPE", s"$enrolment"))
      case "Deenrol" => driver.getCurrentUrl should include(emacDeenrolUrl.replace("ENROLMENT_TYPE", s"$enrolment"))
    }
  }

  def assertGov(enrolment: String) = {
    driver.getCurrentUrl should startWith("https://www.gov")
    findH1().getText should include(enrolment)
  }

  def assertPdfFile(url: String) = {
    driver.getCurrentUrl should endWith("pdf")
    driver.getCurrentUrl should include(url)
  }

  def assertPortalPage(enrolment: String) = driver.getCurrentUrl should include(s"localhost:8080/portal/$enrolment")
  def assertRegisterPage(registerType:String) = findH1().getText should include(registerType)
  def assertSingleSignOn(url: String) = findById("continue").getAttribute("href") should endWith(url)

  def checkErrorMessage(field: String, msg: String) = verifyTextUsingElementId(field + "-error-summary", msg)
  def checkUrlEnd(enrolment: String) = driver.getCurrentUrl should endWith(s"$enrolment")

  def checkPageHeading(text: String) = {
    fluentWait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("h1")))
    findH1().getText shouldBe text
  }

  def isElementVisible(id: String): Boolean = findById(id).isDisplayed
  def validateText(id: String, value: String) = getTextById(id) shouldBe value
  def verifyTextUsingElementId(elementId: String, expectedValue: String)= findById(elementId).getText shouldBe expectedValue
  def verifyInputUsingElementId(elementId: String, expectedValue: String)= findById(elementId).getAttribute("value") shouldBe expectedValue
  def verifyHyperlink(linkText: String) = findByCSS("a[title*=\"" + linkText + "\"]")
  def verifyHyperlinkTarget(id: String, target: String) = Assert.assertEquals(findById(id).getAttribute("href"), basePageUrl+"/"+target)

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

}