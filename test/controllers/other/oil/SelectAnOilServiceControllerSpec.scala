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

package controllers.other.oil

import controllers.ControllerSpecBase
import controllers.actions._
import forms.other.oils.SelectAnOilServiceFormProvider
import models.other.oil.SelectAnOilService
import models.requests.{AuthenticatedRequest, ServiceInfoRequest}
import play.api.data.Form
import play.api.mvc.{AnyContent, Call}
import play.api.test.FakeRequest
import play.api.test.Helpers._
import play.twirl.api.HtmlFormat
import uk.gov.hmrc.auth.core.AffinityGroup.Organisation
import uk.gov.hmrc.auth.core.{Enrolment, Enrolments}
import utils.{FakeNavigator, RadioOption}
import views.html.other.oil.selectAnOilService

class SelectAnOilServiceControllerSpec extends ControllerSpecBase {

  def onwardRoute = routes.HaveYouRegisteredForTiedOilsController.onPageLoad()

  val formProvider = new SelectAnOilServiceFormProvider()
  val form = formProvider()

  def controller() =
    new SelectAnOilServiceController(
      frontendAppConfig,
      messagesApi,
      new FakeNavigator[Call](desiredRoute = onwardRoute),
      FakeAuthAction,
      FakeServiceInfoAction,
      formProvider)

  def viewAsString(form: Form[_] = form) =
    selectAnOilService(frontendAppConfig, form, SelectAnOilService.options.toSeq)(HtmlFormat.empty)(
      fakeRequest,
      messages).toString

  "SelectAnOilService Controller" must {

    "return OK and the correct view for a GET" in {
      val result = controller().onPageLoad()(fakeRequest)

      status(result) mustBe OK
      contentAsString(result) mustBe viewAsString()
    }

    "redirect to the next page when valid data is submitted" in {
      val postRequest = fakeRequest.withFormUrlEncodedBody(("value", SelectAnOilService.options.head.value))

      val result = controller().onSubmit()(postRequest)

      status(result) mustBe SEE_OTHER
      redirectLocation(result) mustBe Some(onwardRoute.url)
    }

    "return a Bad Request and errors when invalid data is submitted" in {
      val postRequest = fakeRequest.withFormUrlEncodedBody(("value", "invalid value"))
      val boundForm = form.bind(Map("value" -> "invalid value"))

      val result = controller().onSubmit()(postRequest)

      status(result) mustBe BAD_REQUEST
      contentAsString(result) mustBe viewAsString(boundForm)
    }

    "return OK" in {
      val result = controller().onPageLoad()(fakeRequest)

      status(result) mustBe OK
    }

    "redirect to next page when valid data is submitted" in {
      val postRequest = fakeRequest.withFormUrlEncodedBody(("value", SelectAnOilService.options.head.value))
      val result = controller().onSubmit()(postRequest)

      status(result) mustBe SEE_OTHER
      redirectLocation(result) mustBe Some(onwardRoute.url)
    }

    "only display Rebated Oils if the user has Tied" in {
      val request = requestWithEnrolments("HMCE-TO")
      val result = controller().getOptions(request)

      result.length mustBe 1
      result.head mustBe RadioOption("selectAnOilService", "rebatedOilsEnquiryService")
    }

    "only display Tied Oils if the user has Rebated" in {
      val request = requestWithEnrolments("HMCE-RO")
      val result = controller().getOptions(request)

      result.length mustBe 1
      result.head mustBe RadioOption("selectAnOilService", "tiedOilsEnquiryService")
    }

    "display no options if the user has both oils" in {
      val request = requestWithEnrolments("HMCE-RO", "HMCE-TO")
      val result = controller().getOptions(request)

      result mustBe Seq()
    }
  }
}
