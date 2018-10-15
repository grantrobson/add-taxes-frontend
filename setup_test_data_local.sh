#!/bin/bash

stubRootPath="http://localhost:9156/setup"

# Delete existing data
printf "Deleting any existing data from the stub\n"
curl -X "DELETE" ${stubRootPath}/all-schemas
curl -X "DELETE" ${stubRootPath}/all-data
printf "\nAn attempt to delete the stub data has been made"

# Populate data
printf "\nPopulating data to the stub\n"

allSchemas=$(find src/test/resources/stubData/getCustomerInfo/schemas -type f -name '*.json')
allData=$(find src/test/resources/stubData/getCustomerInfo/data -type f -name '*.json')

for schema in ${allSchemas}; do
  curl -fsSo /dev/null -H "Content-Type:application/json" -d @${schema} ${stubRootPath}/schema
done

for data in ${allData}; do
  curl -fsSo /dev/null -H "Content-Type:application/json" -d @${data} ${stubRootPath}/data
done

printf "An attempt to populate the stub has been made\n"
