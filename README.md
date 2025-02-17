# PowershellScriptsForSOC
These are powershell scripts I developed to create the SOAR infrastructure of the SOC team because the inbuilt Automation Rules wizard, SUCKS!!

## Cmdlet to find all new unassigned incidents 
1. Used the Get-AzSentinelIncident cmdlet and checked if any "New" incidents are assigned to an owner
2. Assign a variable to the latest "New" incident

## Cmdlet to find all events related to incident
1. Used the Get-AzSentinelRelation to extract alerts associated to an incident

## AzureGraph Query To Find All related events
1. Used the Get-AzOperationalInsightsWorkspace cmdlet to extract events associated with an alert
2. Piped the Invoke-AzOperationalInsightsQuery cmdlet to extract events associated with the AlertARMId, and filtered them down to the information essential for data enrichment
3. I then printed the events for each alert.

## Check each event for IOC (Yet to be implemented)

## Automatically resolve a ticket based on the evidence collected (Still yet to be implemented)

## Set the script/s to as a cron job in the background (Again, i'm yet to reach this stage)


