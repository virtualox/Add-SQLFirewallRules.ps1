<#
.SYNOPSIS
This PowerShell script adds firewall rules for SQL Server, Analysis Services, and miscellaneous application ports.

.DESCRIPTION
The script creates inbound and outbound firewall rules for various SQL Server, Analysis Services, and other common application ports.
It helps automate the process of opening the necessary ports for these services on the host machine.

.PARAMETER DisplayName
A string that represents the display name of the firewall rule.

.PARAMETER LocalPort
An integer that represents the local port number for the firewall rule.

.PARAMETER Protocol
A string that represents the protocol (TCP or UDP) for the firewall rule. Default value is "TCP".

.EXAMPLE
PS> .\AddFirewallRules.ps1
This command runs the script with default values.

.NOTES
The script is designed for administrators and developers who need to configure firewall settings on their machines.

#>

function Add-FirewallRule {
    param (
        [string]$DisplayName,
        [int]$LocalPort,
        [string]$Protocol = "TCP"
    )

    New-NetFirewallRule -DisplayName "Allow inbound $Protocol Port $LocalPort" -Direction Inbound -LocalPort $LocalPort -Protocol $Protocol -Action Allow
    New-NetFirewallRule -DisplayName "Allow outbound $Protocol Port $LocalPort" -Direction Outbound -LocalPort $LocalPort -Protocol $Protocol -Action Allow
    Write-Host "Enabled $DisplayName port $LocalPort" -ForegroundColor Green
}

Write-Host "======== SQL Server Ports ==================="

$SQLPorts = @{
    "SQLServer default instance" = 1433;
    "Dedicated Admin Connection" = 1434;
    "conventional SQL Server Service Broker" = 4022;
    "Transact-SQL Debugger/RPC" = 135;
}

foreach ($entry in $SQLPorts.GetEnumerator()) {
    Add-FirewallRule -DisplayName $entry.Name -LocalPort $entry.Value
}

Write-Host "======== Analysis Services Ports =============="

$AnalysisServicesPorts = @{
    "SSAS Default Instance" = 2383;
    "SQL Server Browser Service" = 2382;
}

foreach ($entry in $AnalysisServicesPorts.GetEnumerator()) {
    Add-FirewallRule -DisplayName $entry.Name -LocalPort $entry.Value
}

Write-Host "======== Misc Applications ===================="

$MiscPorts = @{
    "HTTP" = 80;
    "SSL" = 443;
    "SQL Server Browser Service's 'Browse" = @{
        "Port" = 1434;
        "Protocol" = "UDP";
    }
}

foreach ($entry in $MiscPorts.GetEnumerator()) {
    if ($entry.Value -is [hashtable]) {
        Add-FirewallRule -DisplayName $entry.Name -LocalPort $entry.Value.Port -Protocol $entry.Value.Protocol
    } else {
        Add-FirewallRule -DisplayName $entry.Name -LocalPort $entry.Value
    }
}
