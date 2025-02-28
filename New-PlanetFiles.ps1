function New-PlanetFiles {
    [CmdletBinding( SupportsShouldProcess)]
    param (
        [Parameter(Mandatory = $true)]
        [ValidateSet("Mercury",
        "venus",
        "Earth",
        "Mars",
        "Saturn",
        "Jupiter",
        "Uransus",
        "Neptune",
        "Pluto")]

        [String[]]$PlanetNames
    )
   
    $FilePath = "C:\Scripts\TMFeb2025\Planets"
    
    if ((test-path $FilePath) -eq $false) { new-item -Path $FilePath -ItemType directory }
        IF (($ValidPlanets -contains $p) -eq $true) {
            foreach ($p in $PlanetNames) {
                new-item -ItemType file -path $filepath -Name "$p.md"
            }
        }
        else {Write-Error "Please input a valid planet"}
}

New-PlanetFiles -PlanetNames Earth,afwer