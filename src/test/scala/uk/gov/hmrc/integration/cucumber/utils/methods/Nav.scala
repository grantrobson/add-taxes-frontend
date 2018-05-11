package uk.gov.hmrc.integration.cucumber.utils.methods

import uk.gov.hmrc.integration.cucumber.pages.BasePage

object Nav extends BasePage {

  val url = ""
  val header = ""

  def navigateToAddTaxesUrl(enrolment: String) = driver.navigate.to(addTaxesUrl + s"$enrolment")
  def back() = driver.navigate().back()
  def goToPage() = driver.navigate().to(basePageUrl + url)
  def navigateTo(url: String) = driver.navigate().to(url)
  def navTo(url: String) = navigateTo(basePageUrl + url)
}
