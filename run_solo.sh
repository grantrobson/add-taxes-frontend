#!/bin/bash
ENV="local"
BROWSER="firefox"
DRIVER_PATH=/usr/bin/geckodriver

sbt -Dlogback.configurationFile=logback.xml -Dbrowser=$BROWSER -Denvironment=$ENV 'test-only uk.gov.hmrc.integration.cucumber.utils.RunnerSolo'
