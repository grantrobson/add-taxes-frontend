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
  def navigateToAddTaxesUrl(enrolment: String) = driver.navigate.to(addTaxesUrl + s"$enrolment")
  def navigateToAddTaxesEmployerUrl(enrolment: String) = driver.navigate.to(addTaxesEmployerUrl + s"$enrolment")
  def navigateToAddTaxesOtherUrl(enrolment: String) = driver.navigate.to(addTaxesOtherUrl + s"$enrolment")
  def navigateToAddTaxesSAUrl = driver.navigate.to(addTaxesSAUrl)
  def navigateToAddTaxesVATUrl(enrolment: String) = driver.navigate.to(addTaxesVATUrl + s"$enrolment")
  def navTo(url: String) = navigateTo(basePageUrl + url)
}
