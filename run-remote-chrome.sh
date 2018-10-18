#!/bin/bash

./setup_test_data_local.sh
sbt -Dbrowser=remote-chrome 'test-only uk.gov.hmrc.integration.cucumber.utils.Runner'