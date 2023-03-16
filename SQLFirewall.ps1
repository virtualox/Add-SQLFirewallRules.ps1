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
