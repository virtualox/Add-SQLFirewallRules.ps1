# PowerShell SQL Server and Analysis Services Firewall Rules Script
This PowerShell script adds firewall rules for SQL Server, Analysis Services, and miscellaneous application ports. It helps automate the process of opening the necessary ports for these services on the host machine.

## Requirements
- PowerShell 5.1 or later
- Windows operating system with the built-in Windows Firewall
- Administrator privileges to execute the script and modify firewall rules

## Usage
1. Download the **`Add-SQLFirewallRules.ps1`** script from this repository.
2. Right-click the downloaded script and select "Run with PowerShell" (you may need to run it as an Administrator).
3. The script will create inbound and outbound firewall rules for the specified ports.

## Ports Configured
The script adds firewall rules for the following ports and services:

### SQL Server Ports
- SQL Server default instance: 1433
- Dedicated Admin Connection: 1434
- Conventional SQL Server Service Broker: 4022
- Transact-SQL Debugger/RPC: 135

### Analysis Services Ports
- SSAS Default Instance: 2383
- SQL Server Browser Service: 2382

### Miscellaneous Application Ports
- HTTP: 80
- HTTPS: 443
- SQL Server Browser Service's "Browse": 1434 (UDP)

## Contributing
Feel free to submit issues or pull requests if you have any suggestions, improvements, or bug fixes.
