package controllers.employer

import javax.inject.Inject

import play.api.i18n.{I18nSupport, MessagesApi}
import uk.gov.hmrc.play.bootstrap.controller.FrontendController
import controllers.actions._
import config.FrontendAppConfig
import views.html.employer.partnershipRegisterByPhone

import scala.concurrent.Future

class PartnershipRegisterByPhoneController @Inject()(appConfig: FrontendAppConfig,
                                          override val messagesApi: MessagesApi,
                                          authenticate: AuthAction,
                                          serviceInfo: ServiceInfoAction ) extends FrontendController with I18nSupport {

  def onPageLoad = (authenticate andThen serviceInfo) {
    implicit request =>
      Ok(partnershipRegisterByPhone(appConfig)(request.serviceInfoContent))
  }
}