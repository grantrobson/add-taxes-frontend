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

package controllers.employer.cis.ukbased.contractor

import play.api.data.Form
import utils.FakeNavigator
import controllers.actions.{FakeServiceInfoAction, _}
import controllers._
import forms.employer.IsBusinessRegisteredForPAYEFormProvider
import play.api.test.Helpers._
import models.employer.IsBusinessRegisteredForPAYE
import play.twirl.api.HtmlFormat
import viewmodels.ViewAction
import views.html.employer.isBusinessRegisteredForPAYE

class IsBusinessRegisteredForPAYEControllerSpec extends ControllerSpecBase {

  def onwardRoute = controllers.routes.IndexController.onPageLoad()

  val formProvider = new IsBusinessRegisteredForPAYEFormProvider()
  val form = formProvider()
  val viewAction = ViewAction(routes.IsBusinessRegisteredForPAYEController.onSubmit(), "AddCisUkContractor")

  def controller() =
    new IsBusinessRegisteredForPAYEController(
      frontendAppConfig,
      messagesApi,
      new FakeNavigator(desiredRoute = onwardRoute),
      FakeAuthAction,
      FakeServiceInfoAction,
      formProvider)

  def viewAsString(form: Form[_] = form) =
    isBusinessRegisteredForPAYE(frontendAppConfig, form, viewAction)(HtmlFormat.empty)(fakeRequest, messages).toString
  isBusinessRegisteredForPAYE(
    frontendAppConfig,
    form,
    ViewAction(routes.IsBusinessRegisteredForPAYEController.onSubmit(), "CisUkContractorEpaye"))(HtmlFormat.empty)(
    fakeRequest,
    messages).toString

  "IsBusinessRegisteredForPAYE Controller" must {

    "return OK and the correct view for a GET" in {
      val result = controller().onPageLoad()(fakeRequest)

      status(result) mustBe OK
      contentAsString(result) mustBe viewAsString()
    }

    "redirect to the next page when valid data is submitted" in {
      val postRequest = fakeRequest.withFormUrlEncodedBody(("value", IsBusinessRegisteredForPAYE.options.head.value))

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

    for (option <- IsBusinessRegisteredForPAYE.options) {
      s"redirect to next page when '${option.value}' is submitted" in {
        val postRequest = fakeRequest.withFormUrlEncodedBody(("value", (option.value)))
        val result = controller().onSubmit()(postRequest)

        status(result) mustBe SEE_OTHER
        redirectLocation(result) mustBe Some(onwardRoute.url)
      }
    }
  }
}
