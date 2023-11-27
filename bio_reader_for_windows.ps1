param(
    [int]$boldPercentage = 50  # Default bold percentage
)

# Validate bold percentage range
if ($boldPercentage -lt 10 -or $boldPercentage -gt 90) {
    Write-Host "Bold percentage must be between 10 and 90."
    exit
}

# Get the directory where the script is located
$scriptPath = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

# Define the path to the input file
$inputFilePath = Join-Path -Path $scriptPath -ChildPath "input.txt"

# Read the text from the input file
$text = Get-Content -Path $inputFilePath

# Generate output file name based on first five words and timestamp
$firstLine = ($text -split "\r?\n")[0]
$firstFiveWords = (($firstLine -split ' ', 6)[0..4] -join ' ').Trim()
$timestamp = Get-Date -Format "yyyy-MM-dd HH_mm_ss"
$outputFileName = "$firstFiveWords $timestamp.rtf"
$outputFileName = $outputFileName -replace '[\\/:*?"<>|]', ''  # Remove illegal characters
$outputFilePath = Join-Path -Path $scriptPath -ChildPath $outputFileName

# RTF header and footer
$rtfHeader = "{\rtf1\ansi"
$rtfFooter = "}"
$rtfBody = ""

# Process each line in the text
foreach ($line in $text) {
    $words = $line -split ' '
    foreach ($word in $words) {
        $length = $word.Length
        # Determine the number of characters to bold
        $boldLength = [Math]::Max(1, [Math]::Ceiling($length * $boldPercentage / 100))
        if ($length -eq 2) { $boldLength = 1 }

        # Ensure the boldLength does not exceed the word length
        $boldLength = [Math]::Min($boldLength, $length)

        # Construct the RTF string with bold formatting
        $boldPart = $word.Substring(0, $boldLength)
        if ($length -gt $boldLength) {
            $restPart = $word.Substring($boldLength)
        } else {
            $restPart = ""
        }
        $rtfBody += "{\b $boldPart}$restPart "
    }
    $rtfBody += "\par "
}

# Combine the RTF content
$rtfContent = $rtfHeader + $rtfBody + $rtfFooter

# Write the RTF content to the output file
Set-Content -Path $outputFilePath -Value $rtfContent -Encoding Ascii
