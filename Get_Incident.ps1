Get-AzSentinelIncident -ResourceGroupName $resourceGroup -WorkspaceName $workspace | Where-Object {$_.Status -eq "New"} | Select-Object =ExpandProperty Name -First 1

Get-AzSentinelIncident -ResourceGroupName $resourceGroup -WorkspaceName $workspace | Where-Object {$_.Status -eq "New"} | Select-Object -First 1 | Format-List Name, Status, Severity, Title
