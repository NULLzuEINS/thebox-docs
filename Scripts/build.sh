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

# Create temporary directory
mkdir -p Temp Content Results

# Copy all Markdown files from the content directory to the temporary directory
cp -R *.md Temp

# Create the output directory if it doesn't exist and delete all files in it
mkdir -p Results
rm -rf Results/*


################################################################################
## Generate Multiple Documents
################################################################################

## Generate separate PDF files for each Markdown file in the content directory
echo "\n✅\tGenerate PDF for each file"

# Generate PDF files
for file in Temp/*.md; do
  # Check if $file is a file
  if [ -f "$file" ]; then
    # Get the filename without the extension
    filename=$(basename -- "$file")
    filename="${filename%.*}"
    # Strip leading numbers and following dash from filename
    filename=$(echo $filename | sed 's/^[0-9]-*//')

    # Get the headline from the Markdown file
    title=$(grep -m 1 '^# ' $file | sed 's/# //')

    echo "👉\tBuild single PDF for \"${title}\""
    docker run -v $PWD:/data ghcr.io/vergissberlin/pandoc-eisvogel-de ${file} \
      -o Results/${THEBOX_FILENAME}-${filename}.pdf \
      --defaults Template/Config/defaults-pdf-single.yml \
      --metadata-file Template/Config/metadata-pdf.yml \
      -V title="${title}" \
      -V author="${THEBOX_AUTHOR}" \
      -V subject="${THEBOX_SUBJECT}" \
      -V footer-center="v$document_git_tag" \
      -V date="$document_date";
  fi
done


################################################################################
## Clean up
################################################################################

# Remove the temporary directory
rm -rf Temp
