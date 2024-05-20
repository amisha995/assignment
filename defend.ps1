# defend.ps1

# Function to test internet access
function Test-InternetAccess {
    Write-Host "Testing internet access..."
    try {
        $response = Invoke-WebRequest -Uri "http://www.example.com" -UseBasicParsing
        if ($response.StatusCode -eq 200) {
            Write-Host "Internet access test successful."
        } else {
            Write-Host "Failed to establish internet connection."
        }
    } catch {
        Write-Host "Failed to establish internet connection."
    }
}

# Function to enable internet restriction
function Enable-RestrictInternet {
    Write-Host "Enabling internet restriction..."
    try {
        [System.Net.HttpWebRequest]::DefaultWebProxy = New-Object System.Net.WebProxy("http://proxy",$true)
        Write-Host "Internet restriction enabled."
    } catch {
        Write-Host "Failed to enable internet restriction."
    }
}

# Function to reset internet restriction
function Reset-RestrictInternet {
    Write-Host "Resetting internet restriction..."
    try {
        [System.Net.HttpWebRequest]::DefaultWebProxy = New-Object System.Net.WebProxy($null)
        Write-Host "Internet restriction reset."
    } catch {
        Write-Host "Failed to reset internet restriction."
    }
}

# Main script logic
param (
    [string]$command
)

if ($command -eq "testInternetAccess") {
    Test-InternetAccess
} elseif ($command -eq "enableRestrictInternet") {
    Enable-RestrictInternet
} elseif ($command -eq "resetRestrictInternet") {
    Reset-RestrictInternet
} else {
    Write-Host "Invalid command. Usage: defend.ps1 <command>"
    Write-Host "Available commands: testInternetAccess, enableRestrictInternet, resetRestrictInternet"
}
