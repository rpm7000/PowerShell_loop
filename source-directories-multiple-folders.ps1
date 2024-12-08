# Define source directories (multiple folders)
$SourceFolders = @(
    "D:\SourceFolder1",
    "D:\SourceFolder2",
    "D:\SourceFolder3",
    "D:\SourceFolder4",
    "D:\SourceFolder5",
    "D:\SourceFolder6",
    "D:\SourceFolder7",
    "D:\SourceFolder8",
    "D:\SourceFolder9",
    "D:\SourceFolder10"
)

# Define a single destination folder
$Destination = "D:\ConsolidatedDestination"

# Continuous monitoring loop
while ($true) {
    foreach ($Source in $SourceFolders) {
        try {
            # Copy items recursively from each source to the destination
            Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Force -ErrorAction Stop
        } catch {
            # Log any errors encountered
            Write-Host "Error copying file from $Source: $($_.Exception.Message)"
        }
    }

    # Add a delay to prevent excessive CPU usage
    Start-Sleep -Seconds 1
}
