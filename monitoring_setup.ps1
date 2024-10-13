# Create Log Analytics workspace
$workspaceName = "WebServerWorkspace"
$workspace = New-AzOperationalInsightsWorkspace -ResourceGroupName $resourceGroup -Name $workspaceName -Location $location -Sku "PerGB2018" -RetentionInDays 30

# Link VMs to Log Analytics workspace
$vmList = Get-AzVM -ResourceGroupName $resourceGroup
foreach ($vm in $vmList) {
    Set-AzVMExtension -ResourceGroupName $resourceGroup -VMName $vm.Name -Name "OmsAgentForLinux" -Publisher "Microsoft.EnterpriseCloud.Monitoring" -Type "OmsAgentForLinux" -TypeHandlerVersion "1.10" -Settings @{"workspaceId" = $workspace.WorkspaceId}
}

# Create alerts for CPU and Memory
Add-AzMetricAlertRule -ResourceGroupName $resourceGroup -Name "CpuUsageAlert" -TargetResourceId $vmList[0].Id -MetricName "Percentage CPU" -Operator "GreaterThan" -Threshold 80 -WindowSize "PT5M" -TimeAggregationOperator "Average" -Location $location -Actions $null

Add-AzMetricAlertRule -ResourceGroupName $resourceGroup -Name "MemoryUsageAlert" -TargetResourceId $vmList[0].Id -MetricName "Available Memory Bytes" -Operator "LessThan" -Threshold 104857600 -WindowSize "PT5M" -TimeAggregationOperator "Average" -Location $location -Actions $null
