package uk.gov.hmrc.integration.cucumber.utils.methods

import uk.gov.hmrc.integration.cucumber.pages.BasePage

object Nav extends BasePage {

  val url = ""
  val header = ""

  def navigateToAddTaxesOtherUrl(enrolment: String) = driver.navigate.to(addTaxesOtherUrl + s"$enrolment")
  def navigateToAddTaxesEmployerUrl(enrolment: String) = driver.navigate.to(addTaxesEmployerUrl + s"$enrolment")
  def back() = driver.navigate().back()
  def goToPage() = driver.navigate().to(basePageUrl + url)
  def navigateTo(url: String) = driver.navigate().to(url)
  def navTo(url: String) = navigateTo(basePageUrl + url)
}
