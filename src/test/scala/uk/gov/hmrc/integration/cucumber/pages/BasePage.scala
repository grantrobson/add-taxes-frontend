package uk.gov.hmrc.integration.cucumber.pages

import org.openqa.selenium.{NoAlertPresentException, WebDriver}
import org.scalatest.Matchers
import uk.gov.hmrc.integration.cucumber.utils.driver.Driver

object BasePage extends BasePage {
  val url = "DEFAULT"
  val header = "DEFAULT"
}

trait BasePage extends Matchers {

  val url: String
  val header: String

  val frontendPort = "9949"
  val basePageUrl = s"$envUrl"
  val driver: WebDriver = Driver.instance
  val loginRedirectUrl = s"$urlDecider/business-account/add-tax"

  private def urlDecider: String = {
    val envProperty = System.getProperty("environment", "local").toLowerCase
    envProperty match {
      case "local" => "http://localhost:9730"
      case "qa" => "https://www.qa.tax.service.gov.uk"
      case _ =>  throw new IllegalArgumentException(s"Environment '$envProperty' not known")
    }
  }

  private def envUrl: String = {
    val environmentProperty = System.getProperty("environment", "local").toLowerCase
    environmentProperty match {
      case "local" => s"http://localhost:$frontendPort"
      case "qa" => "https://www.qa.tax.service.gov.uk"
      case _ => throw new IllegalArgumentException(s"Environment '$environmentProperty' not known")
    }
  }

  def deleteCookies() = driver.manage().deleteAllCookies()
}