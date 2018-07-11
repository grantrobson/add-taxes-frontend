package uk.gov.hmrc.integration.cucumber.utils.driver.browsers

import org.openqa.selenium.WebDriver
import org.openqa.selenium.chrome.{ChromeDriver, ChromeOptions}
import org.openqa.selenium.remote.DesiredCapabilities

object ZapChromeBrowser {

  def initialise(javascriptEnabled: Boolean, headlessMode: Boolean): WebDriver = {
    val options = new ChromeOptions()
    options.addArguments("test-type")
    options.addArguments("--no-sandbox")
    options.addArguments("start-maximized")
    options.addArguments("disable-infobars")
    //this is the only thing required for proxying through Zap. ´
    // so this can be set within uk.gov.hmrc.integration.cucumber.utils.driver.browsers.ChromeBrowser via a flag
    options.addArguments("--proxy-server=http://localhost:11000")
    val capabilities: DesiredCapabilities = DesiredCapabilities.chrome()
    options.setCapability("javascript.enabled", javascriptEnabled)
    options.merge(capabilities)
    if (headlessMode) {
      options.addArguments("headless")
    }
    new ChromeDriver(options)
  }
}