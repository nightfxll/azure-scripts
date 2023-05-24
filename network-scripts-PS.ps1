# Deployment using template file and parameter file
$rgName 
New-AzResourceGroupDeployment `
    -ResourceGroupName $rgName`
    -TemplateFile $HOME/ `
    -TemplateParameterFile $HOME
    -AsJob

# Install Azure Network Watcher
$location = (Get-AzureResourceGroup -ResourceGroupName $rgName).location
$vmNames = (Get-AzVM -ResourceGroupName $rgName).Name
foreach ($vmName in $vmNames) {Set-AzVMExtension `
    -ResourceGroupName $rgName `
    -Location $location `
    -VMName $vmName `
    -Name `
    -Publisher `
    -Type 'NetworkWatcherAgentWindows'}

# Session persistence for Load Balancer
$lb = Get-AzLoadBalancer -Name -ResourceGroupName
$lb.LoadBalancingRules[0].LoadDistribution = 'sourceIP'
Set-AzLoadBalancer -LoadBalancer $lb

