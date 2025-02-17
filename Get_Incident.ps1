Get-AzSentinelIncident -ResourceGroupName $resourceGroup -WorkspaceName $workspace | Where-Object {$_.Status -eq "New"} | Select-Object =ExpandProperty Name -First 1 
