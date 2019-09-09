Write-host ========= SQL Server Ports ===================
Write-host Enabling SQLServer default instance port 1433
New-NetFirewallRule -DisplayName "Allow inbound TCP Port 1433" –Direction inbound –LocalPort 1433 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound TCP Port 1433" –Direction outbound –LocalPort 1433 -Protocol TCP -Action Allow
Write-host Enabling Dedicated Admin Connection port 1434
New-NetFirewallRule -DisplayName "Allow inbound TCP Port 1434" -Direction inbound –LocalPort 1434 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound TCP Port 1434" -Direction outbound –LocalPort 1434 -Protocol TCP -Action Allow
Write-host Enabling conventional SQL Server Service Broker port 4022
New-NetFirewallRule -DisplayName "Allow inbound TCP Port 4022" -Direction inbound –LocalPort 4022 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound TCP Port 4022" -Direction outbound –LocalPort 4022 -Protocol TCP -Action Allow
Write-host Enabling Transact-SQL Debugger/RPC port 135
New-NetFirewallRule -DisplayName "Allow inbound TCP Port 135" -Direction inbound –LocalPort 135 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound TCP Port 135" -Direction outbound –LocalPort 135 -Protocol TCP -Action Allow

Write-host ========= Analysis Services Ports ==============
Write-host Enabling SSAS Default Instance port 2383
New-NetFirewallRule -DisplayName "Allow inbound TCP Port 2383" -Direction inbound –LocalPort 2383 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound TCP Port 2383" -Direction outbound –LocalPort 2383 -Protocol TCP -Action Allow
Write-host Enabling SQL Server Browser Service port 2382
New-NetFirewallRule -DisplayName "Allow inbound TCP Port 2382" -Direction inbound –LocalPort 2382 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound TCP Port 2382" -Direction outbound –LocalPort 2382 -Protocol TCP -Action Allow

Write-host ========= Misc Applications ==============
Write-host Enabling HTTP port 80
New-NetFirewallRule -DisplayName "Allow inbound TCP Port 80" -Direction inbound –LocalPort 80 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound TCP Port 80" -Direction outbound –LocalPort 80 -Protocol TCP -Action Allow
Write-host Enabling SSL port 443
New-NetFirewallRule -DisplayName "Allow inbound TCP Port 443" -Direction inbound –LocalPort 443 -Protocol TCP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound TCP Port 443" -Direction outbound –LocalPort 443 -Protocol TCP -Action Allow
Write-host Enabling port for SQL Server Browser Service's 'Browse
New-NetFirewallRule -DisplayName "Allow inbound UDP Port 1434" -Direction inbound –LocalPort 1434 -Protocol UDP -Action Allow
New-NetFirewallRule -DisplayName "Allow outbound UDP Port 1434" -Direction outbound –LocalPort 1434 -Protocol UDP -Action Allow
