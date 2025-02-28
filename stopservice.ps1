$service = Get-service -name bits, spooler

foreach ($s in $service) {
    if ($s.status -eq "stopped") { start-service $s }
}

function restart-TMservice {
    $service = Get-service -name bits, spooler

    foreach ($s in $service) {
        if ($s.status -eq "stopped") { start-service $s }
    }
}

function restart-TMservice1 {
    param (
        [string[]]$serviceName
    )

    foreach ($s in $serviceName) {
        $myservice = get-service -name $s
        if ($myservice.status -eq "stopped") { start-service $myservice }
    }
}

function restart-TMservice2 {
    
    $servicename = Get-Content C:\Scripts\TMFeb2025\myservices.txt
    $servicename = import-csv C:\scripts\TMFeb2025\services.csv
    foreach ($s in $serviceName) {
        $myservice = get-service -name $s
        if ($myservice.status -eq "stopped") { start-service $myservice }
    }
}