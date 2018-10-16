package uk.gov.hmrc.integration.cucumber.utils.driver

import java.net.URL

import com.typesafe.scalalogging.LazyLogging
import org.openqa.selenium.WebDriver
import org.openqa.selenium.chrome.ChromeOptions
import org.openqa.selenium.remote.RemoteWebDriver
import uk.gov.hmrc.integration.cucumber.utils.driver.browsers.{BrowserStack, ChromeBrowser, FirefoxBrowser, ZapChromeBrowser}

import scala.util.Try

object Driver extends LazyLogging with WindowControls {

  val instance: WebDriver = {
    sys.props.get("browser").map(_.toLowerCase) match {
      case Some("chrome") => ChromeBrowser.initialise(javascriptEnabled, sys.props.contains("headless"))
      case Some("remote-chrome")  => createRemoteChrome
      case Some("chrome-headless") => ChromeBrowser.initialise(javascriptEnabled, headlessMode = true)
      case Some("firefox") => FirefoxBrowser.initialise(javascriptEnabled)
      case Some("browserstack") => BrowserStack.initialise()
      case Some("zap-chrome-headless") => ZapChromeBrowser.initialise(javascriptEnabled, sys.props.contains("headless"))
      case Some(name) => sys.error(s"'browser' property '$name' not recognised.")
      case None => {
        logger.warn("'browser' property is not set, defaulting to 'chrome'")
        ChromeBrowser.initialise(javascriptEnabled, headlessMode = false)
      }
    }
  }

  def createRemoteChrome: WebDriver = {
    new RemoteWebDriver(new URL(s"http://localhost:4444/wd/hub"), new ChromeOptions())
  }

  lazy val javascriptEnabled: Boolean = {
    sys.props.get("javascript").map(_.toLowerCase) match {
      case Some("true") => true
      case Some("false") => false
      case Some(_) => sys.error("'javascript' property must be 'true' or 'false'.")
      case None => {
        logger.warn("'javascript' property not set, defaulting to true.")
        true
      }
    }
  }

  var webDriver: WebDriver = {
    sys addShutdownHook {
      Try(webDriver.quit())
    }

    val selectedDriver: WebDriver = instance
    selectedDriver.getWindowHandle

    selectedDriver
  }
}