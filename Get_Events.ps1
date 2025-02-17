foreach ($relation in $relations) {
  if ($relation.Properties.TargetObjectKind -eq "Alert") {
    $alertId = $relation.Properties.TargetObjectId
    $alert = Get-AzSentinelAlert -WorkspaceName $workspaceName -ResourceGroupName $resourceGroupName | Where-Object {$_.Id -eq $alertId}

    $query = "SecurityEvent | where TimeGenerated between (datetime('$($alert.Properties.StartTimeUtc)') .. datetime('$($alert.Properties.EndTimeUtc)')) | where AlertARMId == '$($alert.Id)' | project TimeGenerated, Computer, Account, EventID, Activity"
    $events = Get-AzOperationalInsightsWorkspace `
    -ResourceGroupName $resourceGroupName `
    -Name $workspaceName | `
    Invoke-AzOperationalInsightsQuery `
    -Query $query

    if ($events) {
        Write-Host "  Events for Alert '$($alert.Properties.DisplayName)':"
        $events | Format-Table # Or ConvertTo-Json
            } else {
              Write-Host "  No events found for Alert '$($alert.Properties.DisplayName)'."
            }
    }
  }
