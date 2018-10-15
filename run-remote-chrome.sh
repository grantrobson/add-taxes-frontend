#!/bin/bash

sbt -Dlogback.configurationFile=logback.xml -Dbrowser=remote-chrome 'test-only uk.gov.hmrc.integration.cucumber.utils.Runner'