#!/bin/bash

sbt -Dlogback.configurationFile=logback.xml -Dbrowser=zap-chrome-headless 'test-only uk.gov.hmrc.integration.cucumber.utils.Runner'
sbt 'testOnly uk.gov.hmrc.integration.cucumber.utils.ZapRunner'