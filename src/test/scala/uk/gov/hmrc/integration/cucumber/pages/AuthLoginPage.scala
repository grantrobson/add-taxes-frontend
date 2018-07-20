package uk.gov.hmrc.integration.cucumber.pages

import org.openqa.selenium.By
import org.openqa.selenium.firefox.FirefoxDriver
import org.openqa.selenium.support.ui.Select
import uk.gov.hmrc.integration.cucumber.utils.driver.Driver
import uk.gov.hmrc.integration.cucumber.utils.methods.Input.clickById
import uk.gov.hmrc.integration.cucumber.utils.methods.Nav
import uk.gov.hmrc.integration.cucumber.utils.methods.Wait._

object AuthLoginPage extends BasePage {

  override val url: String = basePageUrl
  override val header: String = ""
  val btaUrl: String = "http://localhost:9020"

  def navigateToStartPage(): Unit = {
    Nav.navTo()
  }

  def loginWithNoEnrolments(affinityGroup: String): Unit = {
    enterRedirectUrl(url)
    selectAffinityGroup(affinityGroup)
    clickOnSubmit()
  }

  def loginWithPreset(affinityGroup: String, preset: String): Unit = {
    enterRedirectUrl(url)
    selectAffinityGroup(affinityGroup)
    addPresets(preset)
    clickOnSubmit()
  }

  private def addPresets(preset: String): Unit = {
    val selectPreset: Select = new Select(driver.findElement(By.name("presets-dropdown")))
    selectPreset.selectByVisibleText(preset)
    waitForElement("add-preset").click()
  }

  def loginWithEnrolmentsActive(affinityGroup: String, enrolments: String): Unit = {
    enterRedirectUrl(btaUrl)
    selectAffinityGroup(affinityGroup)
    addEnrolmentsActive(enrolments)
    clickOnSubmit()
  }

  private def addEnrolment(enrolment: String, id: String = "", index: Int = 0): Unit = {
    val nameField = By.name(s"enrolment[$index].name")
    driver.findElement(nameField).clear()
    driver.findElement(nameField).sendKeys(enrolment)
    val idField = By.name(s"enrolment[$index].taxIdentifier[0].name")
    driver.findElement(idField).clear()
    driver.findElement(idField).sendKeys(id)
  }

  private def addEnrolmentsActive(enrolments: String): Unit = {
    enrolments.replaceAll("\\s", "").split(",").zipWithIndex.foreach { t =>
      val (enrolment, index) = t
      val id = enrolment match {
        case "IR-SA" => "UTR"
        case "HMCE-VATDEC-ORG" => "VATRegNo"
        case _ => ""
      }
      addEnrolment(enrolment, id, index)
      clickById("js-add-enrolment")
    }
  }

  private def addEnrolmentsNotYetActive(enrolments: String): Unit = {
    addEnrolmentsNotYetActive(enrolments)

    val selectLevel: Select = new Select(driver.findElement(By.name("enrolment[0].state")))
    selectLevel.selectByVisibleText("NotYetActivated")
  }

  private def enterRedirectUrl(url: String) {
    val redirectUrlField = By.name("redirectionUrl")
    driver.findElement(redirectUrlField).clear()
    driver.findElement(redirectUrlField).sendKeys(url)
  }

  private def selectAffinityGroup(affinityGroup: String) {
    val selectLevel: Select = new Select(driver.findElement(By.name("affinityGroup")))
    selectLevel.selectByVisibleText(affinityGroup)
  }

  private def clickOnSubmit(): Unit = {
    waitForElement("inputForm").submit()
    Driver.webDriver match {
      case _: FirefoxDriver =>
        waitForPageToChange
      case _  =>
    }
  }
}