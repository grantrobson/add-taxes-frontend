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

package utils.nextpage.vat

import config.FrontendAppConfig
import controllers.vat.ec.{routes => ecRoutes}
import controllers.vat.eurefunds.{routes => euRoutes}
import controllers.vat.moss.{routes => mossRoutes}
import controllers.vat.moss.noneu.{routes => noneuRoutes}
import controllers.vat.moss.newaccount.{routes => newAccountRoutes}
import controllers.vat.rcsl.{routes => rcslRoutes}
import identifiers.WhichVATServicesToAddId
import models.vat.WhichVATServicesToAdd
import play.api.mvc.{Call, Request}
import uk.gov.hmrc.auth.core.AffinityGroup
import uk.gov.hmrc.auth.core.Enrolments
import utils.{HmrcEnrolmentType, NextPage}

trait WhichVATServicesToAddNextPage {

  type WhichVATServicesToAddWithRequests = (WhichVATServicesToAdd, Option[AffinityGroup], Enrolments)

  implicit val whichVATServicesToAdd: NextPage[WhichVATServicesToAddId.type, WhichVATServicesToAddWithRequests] = {
    new NextPage[WhichVATServicesToAddId.type, WhichVATServicesToAddWithRequests] {
      override def get(
        b: WhichVATServicesToAddWithRequests)(implicit appConfig: FrontendAppConfig, request: Request[_]): Call = {

        val (serviceToAdd, affinity, enrolments) = b

        serviceToAdd match {
          case WhichVATServicesToAdd.VAT       => Call("GET", appConfig.getPortalUrl("businessRegistration"))
          case WhichVATServicesToAdd.ECSales   => getECSalesCall(enrolments)
          case WhichVATServicesToAdd.EURefunds => getEURefundsCall(enrolments)
          case WhichVATServicesToAdd.RCSL      => getRCSLCall(enrolments)
          case WhichVATServicesToAdd.MOSS      => getVATMOSSCall(affinity, enrolments)
          case WhichVATServicesToAdd.NOVA      => Call("GET", appConfig.getPortalUrl("novaEnrolment"))
        }
      }
    }
  }

  def getECSalesCall(enrolments: Enrolments)(implicit appConfig: FrontendAppConfig): Call = {
    val hasVAT: Boolean = utils.Enrolments.hasEnrolments(enrolments, HmrcEnrolmentType.VAT)

    if (hasVAT) Call("GET", appConfig.emacEnrollmentsUrl(utils.Enrolments.ECSales))
    else ecRoutes.RegisteredForVATECSalesController.onPageLoad()
  }

  def getEURefundsCall(enrolments: Enrolments)(implicit appConfig: FrontendAppConfig): Call = {
    val hasVAT: Boolean = utils.Enrolments.hasEnrolments(enrolments, HmrcEnrolmentType.VAT)

    if (hasVAT) Call("GET", appConfig.emacEnrollmentsUrl(utils.Enrolments.EURefunds))
    else euRoutes.RegisteredForVATEURefundsController.onPageLoad()
  }

  def getRCSLCall(enrolments: Enrolments)(implicit appConfig: FrontendAppConfig): Call = {
    val hasVAT: Boolean = utils.Enrolments.hasEnrolments(enrolments, HmrcEnrolmentType.VAT)

    if (hasVAT) Call("GET", appConfig.emacEnrollmentsUrl(utils.Enrolments.RCSL))
    else rcslRoutes.RegisteredForVATRCSLController.onPageLoad()
  }

  def getVATMOSSCall(affinity: Option[AffinityGroup], enrolments: Enrolments): Call = {
    val hasVAT: Boolean = utils.Enrolments.hasEnrolments(enrolments, HmrcEnrolmentType.VAT)

    (affinity, hasVAT) match {
      case (Some(AffinityGroup.Individual), _) => newAccountRoutes.SetUpANewAccountController.onPageLoad()
      case (_, true)                           => noneuRoutes.HaveYouRegisteredForVATMOSSController.onPageLoad()
      case (_, false)                          => mossRoutes.WhereIsYourBusinessBasedController.onPageLoad()
    }
  }
}