#!/usr/bin/env sh

# Build PDF files for each Markdown file in the content directory
# and place them in the output directory.

################################################################################
## Include functions
################################################################################
. ./Scripts/functions.sh


################################################################################
## Variables
################################################################################

# Get current date in format DD.MM.YYYY
document_date=$(date +%d.%m.%Y)

# Get current year in format YYYY
document_date_year=$(date +%Y)

# Get latest git tag
document_git_tag=$(git describe --tags --abbrev=0)

# Load dot env file with variables
if [ $CI ]; then
  dontenv .env
else
  set -a
  source .env
  set +a
fi

################################################################################
## Environment specific replacements commands
################################################################################

if [ $CI ]; then
	sedcmd="sed -i"
else
	sedcmd="sed -i ''"
fi

################################################################################
## Requirement
################################################################################

# Check if Docker is installed
if ! [ -x "$(command -v docker)" ]; then
  echo "🚨\tDocker is not installed. Please install Docker!"
  exit 1
fi

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "🚨\tDocker is not running. Please start Docker!"
  exit 1
fi

# Check if sed is installed
if ! [ -x "$(command -v sed)" ]; then
  echo "🚨\tSed is not installed. Please install Sed!"
  exit 1
fi

# Pull docker image ghcr.io/vergissberlin/pandoc-eisvogel-de from GitHub Container Registry if it doesn't exist
if ! docker image inspect ghcr.io/vergissberlin/pandoc-eisvogel-de > /dev/null 2>&1; then
    echo "👉\tPull docker image ghcr.io/vergissberlin/pandoc-eisvogel-de from GitHub Container Registry"
    docker pull ghcr.io/vergissberlin/pandoc-eisvogel-de
fi

################################################################################
## Prepare
################################################################################

# Remove old temoporary directory if it exists
rm -rf Temp

# Create temporary directory
mkdir -p Temp/Content Temp/Results

# Copy REDME.$1.md from the root directory to the temp/content directory
# If language argument is set to de or not set, copy README.md
if [ "$1" = "de" ] || [ -z "$1" ]; then
  cp README.md Temp/Content/README.md
else
  cp README.$1.md Temp/Content
fi

# If language argument is not set, set it ro de
if [ -z "$1" ]; then
  language="de"
  echo "👉\tSet language to de"
else
  echo "👉\tSet language to $1"
  language=$1
fi

################################################################################
## Generate documents
################################################################################

## Generate PDF files for the current language
echo "✅\tGenerate PDF"

# Generate PDF files
for file in Temp/Content/*.md; do
  # Check if $file is a file
  if [ -f "$file" ]; then
    # Get the filename without the extension
    filename=$(basename -- "$file")
    filename="${filename%.*}"
    # Strip leading numbers and following dash from filename
    filename=$(echo $filename | sed 's/^[0-9]-*//')

    # Get the headline from the Markdown file
    title=$(grep -m 1 '^# ' $file | sed 's/# //')

    echo "👉\tBuild PDF for ${language} with the title \"${title}\""
    docker run -v $PWD:/data ghcr.io/vergissberlin/pandoc-eisvogel-de ${file} \
      -o Temp/Results/${THEBOX_FILENAME}.${language}.pdf \
      --defaults Template/Config/defaults-pdf-single.yml \
      --metadata-file Template/Config/metadata-pdf.yml \
      -V title="${title}" \
      -V author="${THEBOX_AUTHOR}" \
      -V subject="${THEBOX_SUBJECT}" \
      -V lang="${language}" \
      -V footer-center="v$document_git_tag" \
      -V date="$document_date";
  fi
done


