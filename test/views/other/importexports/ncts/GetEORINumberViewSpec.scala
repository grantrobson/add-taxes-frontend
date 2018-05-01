/*
 * Copyright 2018 HM Revenue & Customs
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package views.other.importexports.ncts

import play.twirl.api.HtmlFormat
import views.behaviours.ViewBehaviours
import views.html.other.importexports.ncts.getEORINumber

class GetEORINumberViewSpec extends ViewBehaviours {

  val messageKeyPrefix = "getEORINumber"

  def createView = () => getEORINumber(frontendAppConfig)(HtmlFormat.empty)(fakeRequest, messages)

  "GetEORINumber view" must {
    behave like normalPage(createView, messageKeyPrefix)

    "Render the correct content" in {
      val doc =  asDocument(createView())
      val view = doc.text()

      view must include("You need an Economic Operators Registration and Identification (EORI) to add New Computerised Transit System (NCTS) to your account.")
      view must include("Come back to your account and add NCTS once your EORI number arrives.")
      assertLinkById(
        doc,
        "continue",
        "Continue - get an EORI number",
        "https://www.gov.uk/eori#how-to-get-an-eori-number",
        "RegisterNCTSEori:Click:Continue")
    }
  }
}