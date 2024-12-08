# Define source and destination directories
$Source = "D:\RSOS_12_Validation_1\Raw_Data"
$Destination = "D:\RSOS_12_Validation_1\Rw_Data-1"

# Continuous monitoring loop
while ($true) {
    try {
        # Copy items recursively from source to destination
        Copy-Item -Path "$Source\*" -Destination $Destination -Recurse -Force -ErrorAction Stop
    } catch {
        # Log any errors encountered
        Write-Host "Error copying file: $($_.Exception.Message)"
    }

    # Add a delay to prevent excessive CPU usage
    Start-Sleep -Seconds 1
}
