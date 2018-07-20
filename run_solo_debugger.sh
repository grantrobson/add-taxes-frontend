#!/bin/bash
ENV="local"
BROWSER="firefox"
DRIVER_PATH=/usr/bin/geckodriver

sbt -jvm-debug 5005 -Dlogback.configurationFile=logback.xml -Dbrowser=$BROWSER -Denvironment=$ENV 'test-only uk.gov.hmrc.integration.cucumber.utils.RunnerSolo'