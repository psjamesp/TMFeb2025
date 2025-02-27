https://github.com/powershell/powershell
https://github.com/pjsamesp/TMFeb2025

verb-noun
Get-Verb
Get  
Set 
New

Get-ChildItem
Set-Location .\TMFeb2025\
# These are the same thing
dir 
ls

Get-Verb | Sort-Object Verb
(get-command).count
(get-verb).count


Get-Help
Get-Command
Get-Member

Update-Help

Get-Service

get-help -Name Get-Service
get-help -name get-service -Examples
get-help -name Get-service -Full
get-help -name get-service -ShowWindow
get-help -name get-service -Online


Get-Command -Name *service*
Get-command -Verb Get
Get-command -verb Optimize
get-command -Module Storage

Get-Member
get-service | Get-Member
get-service | gm

Get-Service spooler
Get-Service -name Spooler
Get-Service -n spooler
Get-service -DisplayName "Print Spooler"


get-service -name spooler | Select-Object *

get-service -name spooler | Get-Member

get-service -Name spooler, bits | Start-Service 
stop-service -name Spooler

# DO NOT DO THIS
stop-service -name b

get-service | Stop-Service

get-service | Stop-Service -WhatIf
Get-Process | stop-process 

get-command -ParameterName whatif

get-service -name Spooler

$service = get-service -name Spooler
$service
$service | Select-Object *
$service | Select-Object Name, StartType, Status, DisplayName

$service = get-service -name spooler | Select-Object Name, StartType, Status, DisplayName
$service | gm

# I'm a comment
$dime = 10
$dime = "$ ten"
$dime = "10"
$dime = '$ten'

''
""


5 + 5
5 + "five" 

"five" + 5
"5" + 5
$dime + 1

1 + $dime

[string]$dime = 10

("10" + 1).GetType()

1 + "10"

$date = 1152025
[datetime]$date = 02272025

get-command *date*
Get-Date
$date = Get-Date
$date.Day
https://ss64.com/ps/syntax-dateformats.html
https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-date?view=powershell-7.5

Get-Date -Format mm/DD/YYYY #We have problems
get-date -Format MM/dd/yyyy
get-date -Format hh:mm
get-date -Format HH:mm
get-date -Format "MM/dd/yyyy hh:mm"

$date.AddHours(9)
$date.AddHours(-9)
$date.AddDays(-4)

(get-date 2/27/2025) - (get-date 12/25/2024)


Get-ChildItem | Sort-Object -Property name | Format-Table 
Get-ChildItem | Sort-Object -Property name | Format-List

Get-ChildItem | Sort-Object -Property name | Format-Table | select-object name

get-service -name Spooler
get-service -name Spooler | Out-Default
Write-Output "I'm a part of the success stream"

get-service -name spoooooooler
Write-Error "I'm an error"

Write-Warning "Danger Danger Mr. Robertson"

#Verbose is turn off by default
#Do this to turn it on
$VerbosePreference = "continue"

Write-Debug "Hello i'm a lady bug"

Write-Host "I'm a puppy dog" -ForegroundColor green -BackgroundColor DarkRed

https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_output_streams?view=powershell-7.5


$date = Get-Date
$year = $date.Year
Write-Output "The current year is $year"
Write-Output 'The current year is $year'


get-service -Name S* | Start-Service
get-service | Where-Object Name -like S* | start-service 

get-service | Where-Object status -eq Stopped

Find all the files in a specific folder that have an extension of txt (do this 2 different ways)


Get-ChildItem -Filter *.txt
Get-ChildItem -name *.txt
get-childitem | Where-Object name -like *.txt
Get-ChildItem | Where-Object Extension -like .txt*


Get-ChildItem -Path C:\Scripts\ -Recurse |
Where-Object { $_.CreationTime.Year -eq (Get-Date).AddYears(-1).Year }

-eq Eqal
-NE Not Equal
-gt Greater Than
-lt Less Than
-ge Greater Than Equal to
-le Less Than Equal to

5 = 5
5 = = 5
5<> 5

5 -eq 5
5 -ne 5 
5 -gt 5
5 -ge 5


https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.5
"cat" -eq "CAT"
"cat" -ceq "CAT"

$array = "cat", "dog", "lizard"
"cat" -in $array


if (5 -eq 15) {
    write-Output "You should come to Tech Mentor"
}
else { Write-Output "Well you should still come anyway" }

$service = get-service spooler | Select-Object name, Status
if ($service.status -eq "running") { Write-Output "You should be able to print now" }
else { Write-output "$($service.name) is not running" }

Test-Path C:\scripts\TMFeb2025\files

if ((test-path C:\scripts\TMFeb2025\files) -eq $false) {
    New-Item -Path C:\Scripts\TMFeb2025 -name Files -ItemType Directory
}

if (!(test-path C:\scripts\TMFeb2025\files)) { New-Item -Path C:\Scripts\TMFeb2025\ -name files -ItemType Directory }


1..10 | ForEach-Object { new-item -ItemType File -name "$_.md" }

get-service -name bits, spooler | ForEach-Object { if ($_.status -eq "stopped") { Start-service $_ } }


1..10 | % { write-output $_ }
1..10 | ForEach-Object { write-output $_ }

1..10 | ForEach-Object { write-output "dog" }
"dog" | ForEach-Object { write-output $_ }



Get-ChildItem -Path C:\Scripts\TMFeb2025 | Select-Object name | ForEach-Object { write-output $_ }

Get-ChildItem -Path C:\Scripts\TMFeb2025 | Select-Object -ExpandProperty name | 
ForEach-Object { if ($_ -like "*.md") { Remove-item $_ } }


$planets = "Earth", "Mars", 'Saturn'
$planets | ForEach-Object { new-item -ItemType File -name "$_.md" }

$services = get-service -name spooler, bits
$service | ForEach-Object { new-item -ItemType file -Name "$_.Name.md" } #This is broken on purpose
$service | ForEach-Object { new-item -ItemType file -Name "$($_.name).md" }
$services | ForEach-Object { new-item -ItemType file -Name "$($_.name).md" -Force }


Get-ChildItem | Where-Object name -like *.md | Remove-Item
Get-ChildItem -Filter *.md
$files = Get-ChildItem -path C:\Scripts\TMFeb2025 | Select-Object Name


foreach ($currentItemName in $collection) {
    <# $currentItemName is the current item #>
}

ForEach ($f in $files)
{ write-output $f }

ForEach ($file in $files)
{ write-output $f }

$service = get-service spooler, BITS
foreach ($s in $service) {
    stop-service -name $s.Name
}

$service = get-service spooler, BITS
foreach ($s in $service) {
    if ($s.status -eq "stopped") {
        Start-Service $s.name
        write-output "I started the service $($s.displayname)"}
    }
    
$service = (get-content -Path c:\scripts\TMFeb2025\myservices.txt)

$files = 20..100
foreach ($f in $files){new-item -path .\files\$f.md}

$folder = 'C:\scripts\TMFeb2025\files'


Get-ChildItem -Path $folder -Recurse | Where-Object Name -NE "_readmefirst.txt" | Remove-Item
Get-ChildItem -Path $folder -Recurse | Where-Object {$_.Name -eq "_readmefirst.txt" `
-and $_.lastwritetime -gt "5/5/2024"}| Remove-Item

-eq Equal
-NE Not Equal
-gt Great Than
-lt Less Than
-le Less than or Equal to
-ge greater than or equal to
-and 
-like
-notlike
-match

Copy-Item -Path .\Mars.md -Destination C:\scripts\TMFeb2025\files
Move-Item -Path .\earth.md -Destination C:\Scripts\TMFeb2025\files




get-item -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'

Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name PortNumber -value "3399"

New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "smileyface" -value "yes"

Remove-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "smileyface"


Get-PSProvider

Get-PSDrive

$env:OS
$env:USERNAME
$env:USERDOMAIN

$PSVersionTable
$HOME
$PWD
$Error
$Host
$true
$false
$null
$empty = ""




# Remoting
$cred = Get-Credential
Enter-PSSession -ComputerName srv01 -Credential $cred

invoke-command -ComputerName srv01, srv02 -ScriptBlock {$env:COMPUTERNAME} -Credential 714tech\bob

invoke-command -ComputerName (get-content c:\scripts\computers.txt) -ScriptBlock {$env:COMPUTERNAME}
invoke-command -ComputerName (Import-Csv c:\scripts\computers.Import-Csv) -ScriptBlock {$env:COMPUTERNAME}
invoke-command -ComputerName (get-adcomputer -filter "OU=printers, dc=test, dc=lab") -ScriptBlock {$env:COMPUTERNAME}

invoke-command -ComputerName srv01, srv02 -FilePath c:\scripts\myfile.ps1 -Credential 714tech\bob

# File system
Get-ChildItem
Set-LocalGroup
New-Item

Get-PSDrive

$env:computername

If ($IsMacOS -eq $true){}
elseif ($IsLinux -eq $true){}
else {}

switch ($OS)
{
    $IsMacOS {}
    $IsLinux {}
    $IsWindows {}
    Default {}
}


ForEach-Object ($s in $servers)
copy-item -Path \\myshare.test.lab\sql2024update.msu -Destination \\$s\d:\temp
} -parallel


$session = New-PSSession -ComputerName srv01,srv02,dc01 -Credential 714tech\bob

Enter-PSSession -Session $session

copy-item -fromsession $session -path c:\sql.msu -Destination d:\temp

invoke-command srv01,srv02 -ScriptBlock {copy-item -path \\myserverpath\sqlupdate.msu -Destination d:\temp}


Enter-PSSession ubuntu -UserName azureuser


$PSVersionTable
$env:hostname
$env:computername
Enter-PSSession -ComputerName dc01

Invoke-Command -ComputerName dc01 -ScriptBlock{$PSVersionTable} 
Invoke-Command -ComputerName dc01,srv01 -ScriptBlock {$env:COMPUTERNAME}
Invoke-Command -ComputerName dc01,srv01 -ScriptBlock {restart-service Spoojjkbhjvjvler}


foreach ($s in $servers){
    invoke-command -computer $s -ScriptBlock {mystuff here}
}


Enter-PSSession -HostName dc01 -UserName bob


$a = New-PSSession -ComputerName dc01 -Credential (Get-Credential)

invoke-command -Session $a -ScriptBlock {$env:COMPUTERNAME}

$b = New-PSSession -ComputerName dc01 -Credential (Get-Credential)

Get-PSSession |Remove-PSSession


git config --global user.email "james.petty714@outlook.com"
  git config --global user.name "James Petty"