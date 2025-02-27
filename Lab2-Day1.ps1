New-Item -Path ".\Planets" -ItemType Directory -Force

# Create markdown files for each planet using a foreach loop
$planets = @("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto")

foreach ($p in $planets) {
    New-Item -Path ".\Planets\$p.md" -ItemType File -Force
}

$planets | ForEach-Object { New-Item -Path ".\Planets\$_.md" -ItemType File -Force }


New-Item -Path "HKCU:\Software\MyTestKey" -Force
Set-ItemProperty -path "HKCU:\Software\MyTestKey" -name dice -Value 100

# Find files over 1MB in the Windows directory and display name and extension
Get-ChildItem -Path "C:\Windows" -Recurse -File | 
Where-Object { $_.Length -gt 1MB } | 
Select-Object Name, Extension,Directory

$dir = Get-ChildItem -Path "C:\Windows" -Recurse -File | 
Where-Object { $_.Length -gt 1MB } | 
Select-Object Name, Extension,Directory

$dir | Select-Object Directory -Unique | Measure-Object | select Count
($dir | Select-Object Directory -Unique).count


Get-NetIPAddress
255.255.255.0 /24

Set-NetIPAddress -InterfaceIndex 14 -IPAddress 10.0.0.10 

Get-NetFirewallProfile | Where-Object enabled -eq "False" | Set-NetFirewallProfile -Enabled True

Get-NetFirewallRule | where-object {$_.profile -eq "public" -and $_.Direction -eq "inbound"}