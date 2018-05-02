package uk.gov.hmrc.integration.cucumber.pages

import java.util.concurrent.TimeUnit

import cucumber.api.DataTable
import org.junit.Assert
import org.openqa.selenium.support.ui.{ExpectedConditions, FluentWait, Select, WebDriverWait}
import org.openqa.selenium.{By, NoAlertPresentException, WebDriver, WebElement}
import org.scalatest.Matchers
import uk.gov.hmrc.integration.cucumber.pages.AuthLoginPage.clickByCSS
import uk.gov.hmrc.integration.cucumber.utils.driver.Driver

object BasePage extends BasePage {
  val url = "DEFAULT"
  val header = "DEFAULT"
}

trait BasePage extends Matchers {

  val url: String
  val header: String

  val frontendPort = "9949"
  val prodRoute = "auth-login-stub"

  val basePageUrl = s"$envUrl/$prodRoute"

  val driver: WebDriver = Driver.instance

  val loginRedirectUrl = "http://localhost:9730/business-account/add-tax"

  val icsUrl = s"$loginRedirectUrl/other/import-export/ics"
  val emcsUrl = s"$loginRedirectUrl/other/import-export/emcs"
  val ddesUrl = s"$loginRedirectUrl/other/import-export/ddes"

  val emacUrl = "enrolment-management-frontend/ENROLMENT_TYPE/request-access-tax-scheme?continue=%2Fbusiness-account"

  def envUrl: String = {
    val environmentProperty = System.getProperty("environment", "local").toLowerCase
    environmentProperty match {
      case "local" => s"http://localhost:$frontendPort"
      case "qa" => "https://www.qa.tax.service.gov.uk"
      case _ => throw new IllegalArgumentException(s"Environment '$environmentProperty' not known")
    }
  }

  def goToPage() = driver.navigate().to(basePageUrl + url)

  def fluentWait: FluentWait[WebDriver] = new FluentWait[WebDriver](driver)
    .withTimeout(20, TimeUnit.SECONDS)
    .pollingEvery(250, TimeUnit.MILLISECONDS)
    .ignoring(classOf[org.openqa.selenium.NoSuchElementException])

  def waitForElement(id: String): WebElement = waitForElement(By.id(id))

  def waitForElement(by: By): WebElement = fluentWait.until(ExpectedConditions.presenceOfElementLocated(by))

  def waitForPageToChange = fluentWait.until(ExpectedConditions.stalenessOf(find(By.cssSelector("html"))))

  def secondsWait(secs: Int) = Thread.sleep(secs.*(1000))

  def deleteCookies() = driver.manage().deleteAllCookies()

  def back() = driver.navigate().back()

  def pageRefresh() = {
    driver.navigate().refresh()
    try {
      val alert = driver.switchTo().alert()
      alert.accept()
    }
    catch {
      case noapEx: NoAlertPresentException => {}
    }
  }

  def navigateTo(url: String) = driver.navigate().to(url)
  def navTo(url: String) = navigateTo(basePageUrl + url)

  def getTextById(id: String) = findById(id).getText

  def find(by: By) = driver.findElement(by)
  def findById(id: String) = find(By.id(id))
  def findByName(id: String) = driver.findElements(By.name(id))
  def findByClass(className: String) = driver.findElements(By.className(className))
  def findByCSS(css: String) = driver.findElement(By.cssSelector(css))

  def clickById(id: String) = findById(id).click()
  def clickByName(id: String, num: Int) = findByName(id).get(num).click()
  def clickByClass(id: String, num: Int) = findByClass(id).get(num).click()
  def clickByCSS(css: String) = driver.findElement(By.cssSelector(css)).click()
  def clickYes = clickByCSS("[id$=Yes]")
  def clickNo =  clickByCSS("[id$=No]")


  def verifyTextUsingElementId(elementId: String, expectedValue: String)= findById(elementId).getText shouldBe expectedValue
  def verifyInputUsingElementId(elementId: String, expectedValue: String)= findById(elementId).getAttribute("value") shouldBe expectedValue

  def verifyHyperlink(linkText: String) = findByCSS("a[title*=\"" + linkText + "\"]")
  def verifyHyperlinkTarget(id: String, target: String) = Assert.assertEquals(findById(id).getAttribute("href"), basePageUrl+"/"+target)

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

  def checkErrorMessage(field: String, msg: String) = verifyTextUsingElementId(field + "-error-summary", msg)

  def validateErrorSummaryLinksToError(field: String) = {
    clickById(field + "PageErrMsg")
    findById(field).isSelected
  }

  def validateErrorSummaryLinksToError(pageField: String, bodyField: String) = {
    clickById(pageField + "PageErrMsg")
    findById(bodyField).isSelected
  }

  def validateText(id: String, value: String) = getTextById(id) shouldBe value
  def clickContinue() = clickById("continue")
  def findH1() = findByCSS("h1")
  def checkPageHeading(text: String) = {
    fluentWait.until(ExpectedConditions.presenceOfElementLocated(By.cssSelector("h1")))
    findH1().getText shouldBe text
  }

  def dropdownSelect(dropDownId: String, selection: String) = {
    new Select(findById(dropDownId)).selectByVisibleText(selection)
  }

  def isElementVisible(id: String): Boolean = findById(id).isDisplayed

  private def iterate(f: (String, String) => Any)(data: DataTable) = {
    val row = data.asMaps(classOf[String], classOf[String]).iterator
    while (row.hasNext) {
      val map = row.next
      val data = map.get("value")
      val loc = map.get("key")
      f(loc, data)
    }
  }

  val enterDataTable = iterate(sendKeysById) _
  val checkDataTable = iterate(validateText) _

  def ShutdownTest() = driver.quit()

  def navigateToAddTaxesUrl(enrolment: String) = {

    enrolment match {
      case "ics" => driver.navigate().to(icsUrl)
      case "emcs" => driver.navigate().to(emcsUrl)
      case "ddes" => driver.navigate().to(ddesUrl)

    }

  }

  def navigateToEmacUrl(enrolment: String) = {

    val currentUrl = driver.getCurrentUrl
    enrolment match {
      case "ics" =>  currentUrl should  include (emacUrl.replace("ENROLMENT_TYPE", "HMRC-ICS-ORG"))
      case "emcs" => currentUrl should  include (emacUrl.replace("ENROLMENT_TYPE", "HMRC-EMCS-ORG"))
      case "ddes" => currentUrl should  include (emacUrl.replace("ENROLMENT_TYPE", "HMCE-DDES"))
      case _ => fail()

    }

  }

  def clickOnContinue(): Unit = {
    waitForElement("continue-button").submit()
    waitForPageToChange
  }
}