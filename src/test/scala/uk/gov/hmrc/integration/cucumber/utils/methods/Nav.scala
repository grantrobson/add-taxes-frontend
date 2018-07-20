package uk.gov.hmrc.integration.cucumber.utils.methods

import uk.gov.hmrc.integration.cucumber.pages.BasePage

object Nav extends BasePage {

  val url = ""
  val header = ""


  val addTaxesUrl = s"$loginRedirectUrl/"
  val addTaxesVATUrl = s"$loginRedirectUrl/vat/"
  val addTaxesOtherUrl = s"$loginRedirectUrl/other/"
  val addTaxesEmployerUrl = s"$loginRedirectUrl/employer/"
  val addTaxesSAUrl = s"$loginRedirectUrl/self-assessment/"
  val btaPort: String = "http://localhost:9020"
  val addTaxesPort: String = "http://localhost:9730"


  def back() = driver.navigate().back()
  def goToPage() = driver.navigate().to(basePageUrl + url)

  def navigateTo(service:String, url: String) = {
    service match {
      case "BTA" => {
        val suffix = changePort(service, url)
        driver.navigate().to(btaPort + suffix)
      }
      case "AT" => {
        val suffix = changePort(service, url)
        changePort(service, url)
        driver.navigate().to(addTaxesPort + suffix)
      }
      case _ =>
    }
  }

  def navigateToAddTaxesEmployerUrl = driver.navigate.to(addTaxesEmployerUrl)
  def navigateToAddTaxesOtherUrl = driver.navigate.to(addTaxesOtherUrl)
  def navigateToAddTaxesSAUrl = driver.navigate.to(addTaxesSAUrl)
  def navigateToAddTaxesVATUrl = driver.navigate.to(addTaxesVATUrl)
  def navigateToHowToStop(url: String, url2: String) =  driver.navigate.to(s"http://localhost:9730/business-account/deenrol/$url/how-to-stop-$url2")
  def navTo() = driver.navigate.to(basePageUrl)

  private def changePort(service: String, url: String) =
    service match {
      case "AT" => url.stripPrefix(btaPort)
      case "BTA"  => url.stripPrefix(addTaxesPort)

    }
}
