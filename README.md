# Azure Web Server Automation

## Overview
This project automates the deployment, configuration, and monitoring of a web server cluster on Azure using PowerShell scripts. It includes setting up VMs, configuring IIS, adding a Load Balancer, and implementing monitoring.

## Files
- `azure_setup.ps1`: Script to deploy web server VMs on Azure.
- `iis_setup.ps1`: Script to configure IIS on all VMs.
- `load_balancer_setup.ps1`: Script to set up Azure Load Balancer.
- `monitoring_setup.ps1`: Script to set up monitoring and alerting.

## Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Azure-Web-Server-Automation.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Azure-Web-Server-Automation
   ```
3. Follow the steps below to execute each script:

### Step 1: Deploy Web Server VMs
```powershell
./azure_setup.ps1
   ```
### Step 2: Configure IIS
```powershell
./iis_setup.ps1
   ```
### Step 3: Set Up Load Balancer
```powershell
./load_balancer_setup.ps1
   ```
### Step 4: Configure Monitoring and Alerting
```powershell
./monitoring_setup.ps1
   ```
### Requirements
* PowerShell
* Azure subscription
* Azure PowerShell module (Install-Module -Name Az -AllowClobber -Scope CurrentUser)

License
This project is licensed under the MIT License. See the LICENSE file for details.












