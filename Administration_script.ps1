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

# Import a Business Central license file
Import-NAVServerLicense -ServerInstance BC220 -LicenseFile "C:\path\to\your\license.flf"

# Enable API endpoints (REST and ODATA)
Set-NAVServerConfiguration BC220 -KeyName ODataServicesEnabled -KeyValue true #OData
Set-NAVServerConfiguration BC220 -KeyName ApiServicesEnabled -KeyValue true #REST

# Get BC running configurations
Get-NAVServerConfiguration BC220

# List all Business Central instances
Get-NAVServerInstance

# Restart the NAV server instance to apply configuration changes
Restart-NAVServerInstance -ServerInstance BC220

# View installed apps in Business Central (BC220) via grid view
Get-NAVAppInfo -ServerInstance BC220 | Out-GridView

# List all users in the BC220 server instance and their states
Get-NAVServerUser -ServerInstance BC220 | Select-Object UserName,State | Out-GridView

# Count the number of users in Business Central
Get-NAVServerUser -ServerInstance BC220 | Measure-Object


# Enable a specific user in Business Central (cereals\administrator)
Set-NAVServerUser -ServerInstance BC220 -UserName "cereals\fkibet" -State Enabled

# Check user permissions for a specific user
Get-NAVServerUserPermissionSet -ServerInstance BC220 -UserName "cereals\administrator"

# Add a new user
New-NAVServerUser -ServerInstance BC220 -UserName "cereals\administrator" -WindowsAccount

# Remove an old user from Business Central
Remove-NAVServerUser -ServerInstance BC220 -UserName "cereals\olduser"