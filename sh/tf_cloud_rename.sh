
# This script sends a requests to the Terraform Cloud API and updates the
# organization name from "${OLD_TFC_ORG_NAME}" to "${NEW_TFC_ORG_NAME}".
#
# This script can be useful when you need to rename a TFC Organization without
# wanting to (or being able to) start from scratch. 
#
# Use this script with care, as this request is carried out against the API, only.
# Check your (local) Terraform Resources for references to `OLD_TFC_ORG_NAME` and
# rename the values and / or use `terraform state mv` to update your Terraform state.

export OLD_TFC_ORG_NAME="callbuslab"
export NEW_TFC_ORG_NAME="dnr14_organization"
export TFC_TOKEN=""

curl \
  --show-error \
  --request "PATCH" \
  --header "Authorization: Bearer ${TFC_TOKEN}" \
  --header "Content-Type: application/vnd.api+json" \
  --data "{ \"data\": { \"type\": \"organizations\", \"attributes\": { \"name\": \"${NEW_TFC_ORG_NAME}\" } } }" \
  "https://app.terraform.io/api/v2/organizations/${OLD_TFC_ORG_NAME}"