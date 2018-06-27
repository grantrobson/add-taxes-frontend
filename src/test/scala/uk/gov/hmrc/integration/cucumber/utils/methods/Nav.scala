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


  def back() = driver.navigate().back()
  def goToPage() = driver.navigate().to(basePageUrl + url)
  def navigateTo(url: String) = driver.navigate().to(url)
  def navigateToAddTaxesEmployerUrl = driver.navigate.to(addTaxesEmployerUrl)
  def navigateToAddTaxesOtherUrl = driver.navigate.to(addTaxesOtherUrl)
  def navigateToAddTaxesSAUrl = driver.navigate.to(addTaxesSAUrl)
  def navigateToAddTaxesVATUrl = driver.navigate.to(addTaxesVATUrl)
  def navTo(url: String) = navigateTo(basePageUrl + url)
}
