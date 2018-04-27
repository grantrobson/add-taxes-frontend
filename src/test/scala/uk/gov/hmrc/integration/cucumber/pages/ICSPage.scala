package uk.gov.hmrc.integration.cucumber.pages

import org.openqa.selenium.By
import org.openqa.selenium.support.ui.Select


object ICSPage extends BasePage {

  override val url: String = ""
  override val header: String = ""

  def clickYes = clickById("economicOperatorsRegistrationAndIdentification.Yes")

  def clickNo = clickById("economicOperatorsRegistrationAndIdentification.No")


}
