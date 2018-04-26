package uk.gov.hmrc.integration.cucumber.utils.driver.browsers

import org.openqa.selenium.WebDriver
import org.openqa.selenium.chrome.{ChromeDriver, ChromeOptions}
import org.openqa.selenium.remote.DesiredCapabilities

object ChromeBrowser {

  def initialise(javascriptEnabled: Boolean, headlessMode: Boolean): WebDriver = {
    val options = new ChromeOptions()
    options.addArguments("test-type")
    options.addArguments("--no-sandbox")
    options.addArguments("start-maximized")
    options.addArguments("disable-infobars")
    val capabilities: DesiredCapabilities = DesiredCapabilities.chrome()
    options.setCapability("javascript.enabled", javascriptEnabled)
    options.merge(capabilities)
    if (headlessMode) {
      options.addArguments("headless")
    }
    new ChromeDriver(options)
  }

}
