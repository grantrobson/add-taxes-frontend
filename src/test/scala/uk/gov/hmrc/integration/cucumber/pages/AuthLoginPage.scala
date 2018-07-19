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

  def navigateToStartPage(): Unit = {
    Nav.navigateTo(url)
  }

  def loginWithNoEnrolments(affinityGroup: String): Unit = {
    enterRedirectUrl()
    selectAffinityGroup(affinityGroup)
    clickOnSubmit()
  }

  def loginWithPreset(affinityGroup: String, preset: String): Unit = {
    enterRedirectUrl()
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
    enterRedirectUrl()
    selectAffinityGroup(affinityGroup)
    addEnrolmentsActive(enrolments)
    clickOnSubmit()
  }

  private def addEnrolmentsActive(enrolments: String): Unit = {
    enrolments.replaceAll("\\s", "").split(",").zipWithIndex.foreach { t =>
      val (e,i) = t
      val activationField = By.name("enrolment["+i+"].name")
      driver.findElement(activationField).clear()
      driver.findElement(activationField).sendKeys(e)
      clickById("js-add-enrolment")
      e match {
        case "IR-SA" => {
          val activationField = By.name("enrolment["+i+"].taxIdentifier["+i+"].name")
          driver.findElement(activationField).clear()
          driver.findElement(activationField).sendKeys("UTR")
        }
        case "HMCE-VATDEC-ORG" => {
          val activationField = By.name("enrolment["+i+"].taxIdentifier["+i+"].name")
          driver.findElement(activationField).clear()
          driver.findElement(activationField).sendKeys("VATRegNo")
        }
        case _ =>
      }
    }
  }

  private def addEnrolmentsNotYetActive(enrolments: String): Unit = {
    val activationField = By.name("enrolment[0].name")
    driver.findElement(activationField).clear()
    driver.findElement(activationField).sendKeys(enrolments)
    val selectLevel: Select = new Select(driver.findElement(By.name("enrolment[0].state")))
    selectLevel.selectByVisibleText("NotYetActivated")
    enrolments match {
      case "IR-SA" => {
        val activationField = By.name("enrolment[0].taxIdentifier[0].name")
        driver.findElement(activationField).clear()
        driver.findElement(activationField).sendKeys("UTR")
      }
      case _ =>
    }
  }

  private def enterRedirectUrl() {
    val redirectUrlField = By.name("redirectionUrl")
    driver.findElement(redirectUrlField).clear()
    driver.findElement(redirectUrlField).sendKeys(loginRedirectUrl)
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