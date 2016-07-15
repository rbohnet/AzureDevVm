Login-AzureRmAccount
Select-AzureSubscription -SubscriptionName 'Visual Studio Premium with MSDN' -Current

.\Deploy-AzureResourceGroup.ps1 `
     -StorageAccountName 'shareduswsa' `
     -ResourceGroupName 'rbdev-rg' `
     -ResourceGroupLocation 'westus' `
     -TemplateFile '..\templates\azure_attachexisting.json' `
     -TemplateParametersFile '..\templates\azure_attachexisting.parameters.json'
