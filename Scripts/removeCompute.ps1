#Login-AzureRmAccount
#Select-AzureSubscription -SubscriptionName 'Visual Studio Premium with MSDN' -Current

# Shutdown VMs
Get-AzureRmVM -ResourceGroupName 'rbdev-rg' | Stop-AzureRmVM -Force -Verbose
 
# Destroy VMs and Preserve State
Get-AzureRmVM -ResourceGroupName 'rbdev-rg' | Remove-AzureRmVM -Force -Verbose
