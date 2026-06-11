#!/usr/bin/env bash
# Downloads the Tools of Expansion team photos from Figma's asset CDN into ./images
# Run this from the same folder as your HTML, on your own machine, within ~7 days
# (the Figma asset URLs expire). After it finishes, set USE_LOCAL = true in the HTML.
set -euo pipefail

BASE="https://www.figma.com/api/mcp/asset"
mkdir -p images

declare -A PHOTOS=(
  ["anvita-beohar"]="aad2477c-7baa-49c6-803e-f9cfe4591705"
  ["ashish-john-mundu"]="430e2899-f433-4cd7-a0f3-9c08a26c6cb7"
  ["beatrice-lontano"]="982dc43a-8578-4309-aec6-2d7701487a74"
  ["bharghavi-kirubasankar"]="0f3bce81-b929-4133-bc9b-53008f834438"
  ["catherine-pulickan"]="8f06d87c-a3ac-448f-b736-9781cbc782de"
  ["cindy-hoang"]="c8354daf-41b1-4e48-bb87-7b7e6d6a29f5"
  ["emily-lucitt-oconnor"]="3f7f564a-bd2e-4c14-aed0-0cca3c617be9"
  ["ester-monroy-gatell"]="b4f08ad8-5c59-4da4-bcfd-22da74b8b7b0"
  ["kamaljeet-singh"]="f531aadc-4c21-4e20-8867-319d7df37c30"
  ["karen-gosriminski"]="580e4246-5816-49b9-95ee-0566901bc6d8"
)

for slug in "${!PHOTOS[@]}"; do
  id="${PHOTOS[$slug]}"
  echo "Downloading ${slug}.jpg ..."
  curl -sS -L -f -o "images/${slug}.jpg" "${BASE}/${id}" \
    && echo "  ok" \
    || echo "  FAILED (URL may have expired — re-export from Figma)"
done

echo
echo "Done. Photos are in ./images"
echo "Now open the HTML and set:  const USE_LOCAL = true;"
