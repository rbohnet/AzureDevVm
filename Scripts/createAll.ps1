# Exmample of how to turn off and turn on resources
# Taken from
# https://alexandrebrisebois.wordpress.com/2015/11/29/on-off-done-right-on-azure/ 

#Login-AzureRmAccount
#Select-AzureSubscription -SubscriptionName 'Visual Studio Premium with MSDN' -Current
#New-AzureRmResourceGroup -Name 'rbenv-rg' -Location 'westus'


# Deploy the Template to the Resource Group
#
.\Deploy-AzureResourceGroup.ps1 `
        -StorageAccountName 'shareduswsa' `
	    -ResourceGroupName 'rbdev-rg' `
		-ResourceGroupLocation 'westus' `
        -TemplateFile '..\templates\azuredeploy.json' `
        -TemplateParametersFile '..\templates\azuredeploy.parameters.json' `
        -UploadArtifacts
