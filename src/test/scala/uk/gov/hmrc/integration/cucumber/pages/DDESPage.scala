package uk.gov.hmrc.integration.cucumber.pages

object DDESPage extends BasePage {

  override val url: String = ""
  override val header: String = ""

  def clickYes = clickById("doYouHaveDAN.Yes")

  def clickNo = clickById("doYouHaveDAN.No")


}
