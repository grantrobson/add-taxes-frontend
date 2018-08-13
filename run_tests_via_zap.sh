#!/bin/bash

sbt -Dlogback.configurationFile=logback.xml -Dbrowser=zap-chrome-headless 'test-only uk.gov.hmrc.integration.cucumber.utils.ZapTestsRunner'
sbt 'testOnly uk.gov.hmrc.integration.cucumber.utils.ZapScanRunner'