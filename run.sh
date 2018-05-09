#!/bin/bash

sbt -Dlogback.configurationFile=logback.xml -Dbrowser=chrome-headless 'test-only uk.gov.hmrc.integration.cucumber.utils.Runner'
