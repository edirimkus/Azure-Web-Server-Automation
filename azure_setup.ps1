# Install Azure module
Install-Module -Name Az -AllowClobber -Scope CurrentUser

# Login to Azure
Connect-AzAccount

# Define parameters
$resourceGroup = "MyResourceGroup"
$location = "EastUS"
$vmNamePrefix = "WebServer"
$vmSize = "Standard_DS1_v2"
$image = "Win2019Datacenter"

# Create resource group
New-AzResourceGroup -Name $resourceGroup -Location $location

# Loop to create multiple VMs
for ($i = 1; $i -le 3; $i++) {
    $vmName = "$vmNamePrefix$i"
    New-AzVM -ResourceGroupName $resourceGroup -Name $vmName -Location $location -VirtualNetworkName "$resourceGroup-vnet" -SubnetName "default" -SecurityGroupName "$resourceGroup-nsg" -PublicIpAddressName "$vmName-pip" -OpenPorts 80 -Size $vmSize -Image $image
}
