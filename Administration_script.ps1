# Check the current execution policy
Write-Output "Current Execution Policy:"
Get-ExecutionPolicy

# Temporarily set execution policy to Bypass for this session
Write-Output "Temporarily setting Execution Policy to Bypass for this session..."
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Define the path to the navadmintool.ps1 script
$NavAdminToolPath = "C:\Program Files\Microsoft Dynamics 365 Business Central\220\Service\navadmintool.ps1"

Write-Output "Importing navadmintool.ps1..."
Import-Module -Name $NavAdminToolPath

# List all available cmdlets related to NAV
Write-Output "Listing all available cmdlets related to NAV:"
Get-Command *NAV*



