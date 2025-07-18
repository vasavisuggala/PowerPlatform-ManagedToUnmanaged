<#
.SYNOPSIS
    PowerShell script to convert a Power Platform environment from Managed to Unmanaged.

.DESCRIPTION
    In Microsoft Power Platform, environments can be manually upgraded from Unmanaged to Managed. 
    However, reversing this change (Managed to Unmanaged) is not supported in the Admin Center UI. 
    This script allows tenant admins to programmatically downgrade an environment from Managed to Unmanaged.

    Use this when:
    - A project team no longer requires strict governance for an environment.
    - Premium licensing costs for Managed environments are no longer affordable.
    - You need to correct an accidental governance configuration.

.AUTHOR
    Vasavi Suggala (GitHub: @vasavisuggala)

.VERSION
    1.0.0

.LICENSE
    MIT License

.REQUIREMENTS
    - Microsoft.PowerApps.Administration.PowerShell module
    - Admin permissions for the target environment

.NOTES
    ⚠️ Caution: This script modifies environment governance. 
    Use with care and avoid applying it on production environments unless absolutely necessary.

#>

# Connect to Power Platform
Write-Host "🔑 Signing in to Power Platform Admin account..." -ForegroundColor Cyan
Add-PowerAppsAccount

# Update Governance Configuration
Write-Host "🔄 Updating governance configuration to Unmanaged..." -ForegroundColor Yellow

# Define the updated configuration
$UpdatedGovernanceConfiguration = [pscustomobject]@{
    protectionLevel = "Basic"
}

# Replace this with your environment GUID
$EnvironmentGUID = "c3d4b683-d8e1-e912-b445-6e7be33f630d"

# Apply the change
Set-AdminPowerAppEnvironmentGovernanceConfiguration `
    -EnvironmentName $EnvironmentGUID `
    -UpdatedGovernanceConfiguration $UpdatedGovernanceConfiguration

# Confirmation
Write-Host "✅ Environment $EnvironmentGUID successfully updated from Managed ➡ Unmanaged." -ForegroundColor Green

# Optional: Verify configuration
Write-Host "🔍 Verifying updated governance configuration..." -ForegroundColor Cyan
Get-AdminPowerAppEnvironmentGovernanceConfiguration `
    -EnvironmentName $EnvironmentGUID
