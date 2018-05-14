#!/bin/bash

sbt -Dlogback.configurationFile=logback.xml -Dbrowser=chrome-headless 'test-only uk.gov.hmrc.integration.cucumber.utils.Runner'
sbt -Dlogback.configurationFile=logback.xml -Dbrowser=firefox 'test-only uk.gov.hmrc.integration.cucumber.utils.RunnerFirefox'