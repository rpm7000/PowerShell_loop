# Define source and destination directories
$Folders = @(
    @{Source = "C:\Users\Admin\Downloads\New folder\A"; Backup = "C:\Users\Admin\Downloads\New folder\A_BACKUP"},
    @{Source = "C:\Users\Admin\Downloads\New folder\B"; Backup = "C:\Users\Admin\Downloads\New folder\B_BACKUP"},
    @{Source = "C:\Users\Admin\Downloads\New folder\C"; Backup = "C:\Users\Admin\Downloads\New folder\C_BACKUP"}
)

# Continuous monitoring loop
while ($true) {
    foreach ($Folder in $Folders) {
        $Source = $Folder.Source
        $Backup = $Folder.Backup

        try {
            # Ensure the backup folder exists
            if (-not (Test-Path -Path $Backup)) {
                New-Item -ItemType Directory -Path $Backup -Force | Out-Null
            }

            # Copy items recursively from source to backup folder
            Copy-Item -Path "$Source\*" -Destination $Backup -Recurse -Force -ErrorAction Stop
        } catch {
            # Log any errors encountered
            Write-Host "Error copying files from $($Source) to $($Backup): $($_.Exception.Message)"
        }
    }

    # Add a delay to prevent excessive CPU usage
    Start-Sleep -Seconds 1
}
