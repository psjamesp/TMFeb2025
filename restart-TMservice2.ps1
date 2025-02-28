function restart-TMservice2 {
    [CmdletBinding (SupportsShouldProcess)]
    param (
        [Parameter(ParameterSetName='ServiceNames', Mandatory = $true)]
        [string[]]$serviceName,
        
        [Parameter(ParameterSetName='CSVFile', Mandatory = $true)]
        [string]$csvFile,
        
        [Parameter(ParameterSetName='TXTFile', Mandatory = $true)]
        [string]$txtFile
    )
    
    # Initialize an array to hold service names
    $services = @()
    
    # Determine which parameter was used and load services accordingly
    if ($serviceName) {
        $services = $serviceName
    }
    elseif ($csvFile) {
        if (Test-Path $csvFile) {
            # Import service names from CSV file
            # Assumes first column contains service names
            $csvData = Import-Csv $csvFile
            $services = $csvData | Select-Object -ExpandProperty ServiceName
        }
        else {
            Write-Error "CSV file not found: $csvFile"
            return
        }
    }
    elseif ($txtFile) {
        if (Test-Path $txtFile) {
            # Import service names from text file (one per line)
            $services = Get-Content $txtFile
        }
        else {
            Write-Error "TXT file not found: $txtFile"
            return
        }
    }
    
    # Process each service
    foreach ($s in $services) {
        try {
            $myservice = Get-Service -Name $s.Trim() -ErrorAction Stop
            
            if ($myservice.Status -eq "Stopped") {
                Write-Host "Starting service: $s"
                Start-Service -Name $s
            }
        }
        catch {
            Write-Error "Error processing service '$s': $_"
        }
    }
}

restart-TMservice2 -serviceName bits,spooler -WhatIf

restart-TMservice2 -csv C:\scripts\TMFeb2025\services.csv
restart-tmservice2 -txtFile C:\Scripts\TMFeb2025\myservices.txt

restart-TMservice2 -serviceName bits,spooler  -csv C:\scripts\TMFeb2025\services.csv -txtFile C:\Scripts\TMFeb2025\myservices.txt


restart-tmservice2 -csvFile sdf -


$sun = read-host "What collor is the sun? "