# Define Load Balancer parameters
$lbName = "WebServerLoadBalancer"
$frontendIp = "frontendip"
$backendPool = "backendpool"
$probe = "HealthProbe"
$rule = "LoadBalancingRule"

# Create Load Balancer
$frontendIpConfig = New-AzLoadBalancerFrontendIpConfig -Name $frontendIp -PublicIpAddress $publicIp
$backendAddressPool = New-AzLoadBalancerBackendAddressPoolConfig -Name $backendPool
$probeConfig = New-AzLoadBalancerProbeConfig -Name $probe -Protocol Http -Port 80 -RequestPath "/"
$ruleConfig = New-AzLoadBalancerRuleConfig -Name $rule -Protocol Tcp -FrontendPort 80 -BackendPort 80 -IdleTimeoutInMinutes 15 -EnableFloatingIP $false -FrontendIpConfiguration $frontendIpConfig -BackendAddressPool $backendAddressPool -Probe $probeConfig

New-AzLoadBalancer -ResourceGroupName $resourceGroup -Name $lbName -Location $location -FrontendIpConfiguration $frontendIpConfig -BackendAddressPool $backendAddressPool -Probe $probeConfig -LoadBalancingRule $ruleConfig
