$service = Get-service -name bits,spooler

foreach ($s in $service){
    if ($s.status -eq "stopped"){start-service $s}
}