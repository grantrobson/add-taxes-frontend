#!/bin/bash

sbt -Dbrowser=remote-chrome 'test-only uk.gov.hmrc.integration.cucumber.utils.Runner'