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
  val host = "http://localhost:"
  val btaPort: String = "9020"
  val addTaxesPort: String = "9730"


  def back() = driver.navigate().back()
  def goToPage() = driver.navigate().to(basePageUrl + url)

  def navigateTo(service: String, url: String) = {
    val port = service match {
      case "BTA" => btaPort
      case "AT" => addTaxesPort
    }
    driver.navigate().to(host + port + stripHostPort(url))
  }

  def navigateToAddTaxesEmployerUrl = driver.navigate.to(addTaxesEmployerUrl)
  def navigateToAddTaxesOtherUrl = driver.navigate.to(addTaxesOtherUrl)
  def navigateToAddTaxesSAUrl = driver.navigate.to(addTaxesSAUrl)
  def navigateToAddTaxesVATUrl = driver.navigate.to(addTaxesVATUrl)
  def navigateToHowToStop(url: String, url2: String) =  driver.navigate.to(s"http://localhost:9730/business-account/deenrol/$url/how-to-stop-$url2")
  def navTo() = driver.navigate.to(basePageUrl)

  private def stripHostPort(url: String): String = url.stripPrefix(host).replaceAll(s"(^\\d{4})", "")
}
