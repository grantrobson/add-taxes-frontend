package uk.gov.hmrc.integration.cucumber.pages


object EMCSPage extends BasePage {

  override val url: String = ""
  override val header: String = ""

  def clickYes = clickById("doYouHaveASEEDNumber.Yes")

  def clickNo = clickById("doYouHaveASEEDNumber.No")


}
