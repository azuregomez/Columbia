$rgname = "Columbia07-rg"
$location = "Central US"
$rg = get-azresourcegroup -location $location -name $rgname
if ($null -eq $rg)
{
    new-azresourcegroup -location $location -name $rgname
}
$TemplateFile = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot,"azuredeploy.json"))
$TemplateParametersFile = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot, "azuredeploy.parameters.json"))
New-AzResourceGroupDeployment -ResourceGroupName $rgname -TemplateFile $TemplateFile -TemplateParameterFile $TemplateParametersFile