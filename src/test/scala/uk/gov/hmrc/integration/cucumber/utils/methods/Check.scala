package uk.gov.hmrc.integration.cucumber.utils.methods

import org.openqa.selenium.By
import uk.gov.hmrc.integration.cucumber.pages.BasePage
import uk.gov.hmrc.integration.cucumber.utils.methods.Find._

object Check extends BasePage {

  val url = ""
  val header = ""
  val emacEnrolUrl   = "enrolment-management-frontend/ENROLMENT_TYPE/request-access-tax-scheme?continue=%2Fbusiness-account"
  val emacDeenrolUrl = "enrolment-management-frontend/ENROLMENT_TYPE/remove-access-tax-scheme?continue=%2Fbusiness-account"

  def assertEmacUrl(enrolment: String, status: String) = {
    status match {
      case "Enrol" => urlIncludes(emacEnrolUrl.replace("ENROLMENT_TYPE", s"$enrolment"))
      case "Deenrol" => urlIncludes(emacDeenrolUrl.replace("ENROLMENT_TYPE", s"$enrolment"))
    }
  }

  def assertEmacHeader = findH1().getText should include("Request access to")

  def assertGov(enrolment: String) = {
    driver.getCurrentUrl should startWith("https://www.gov")
    findH1().getText should include(enrolment)
  }

  def assertPdfFile(url: String) = {
    checkUrlEnd("pdf")
    urlIncludes(url)
  }

  def assertPortalPage(enrolment: String) = {
    val envProperty = System.getProperty("environment", "local").toLowerCase

    envProperty match {
      case "local" => urlIncludes(s"localhost:8080/portal/$enrolment")
      case "qa" => urlIncludes(s"www.qa.tax.service.gov.uk/$enrolment?lang=eng")
    }
  }
  def assertRegisterPage(registerType:String) = findH1().getText should include(registerType)
  def assertSingleSignOn(url: String) = findById("continue").getAttribute("href") should endWith(url)

  def checkUrlEnd(enrolment: String) = driver.getCurrentUrl should endWith(s"$enrolment")
  private def urlIncludes(assert: String) = driver.getCurrentUrl should include(assert)

  def checkPageHeading(text: String) = {
    Wait.waitForElement(By.cssSelector("h1"))
    findH1().getText shouldBe text
  }

  def isElementVisible(id: String): Boolean = findById(id).isDisplayed
}