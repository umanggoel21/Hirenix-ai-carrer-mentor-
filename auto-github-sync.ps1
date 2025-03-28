$repoPath = "C:\Users\Umang\Hirenix-ai-carrer-mentor-"
$delayBetweenChecks = 60  # seconds

Write-Host "Starting auto-sync to GitHub - watching for changes..."
Write-Host "Press Ctrl+C to stop"

while ($true) {
    Set-Location -Path $repoPath
    
    # Check if there are any changes
    $status = git status --porcelain
    
    if ($status) {
        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        Write-Host "Changes detected at $timestamp, pushing to GitHub..."
        
        git add .
        git commit -m "Auto-commit: $timestamp"
        git push origin main
        
        Write-Host "Changes pushed successfully!"
    } else {
        Write-Host "No changes detected. Checking again in $delayBetweenChecks seconds..." -ForegroundColor Gray
    }
    
    # Wait before checking again
    Start-Sleep -Seconds $delayBetweenChecks
} 