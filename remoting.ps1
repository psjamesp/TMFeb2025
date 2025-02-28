HTTP: 5985
Https: 5986

Enable-PSRemoting

# 1:1 Remoting
Enter-PSSession -ComputerName DC01

Enter-PSSession -ComputerName dc01 -Credential 714tech\bob

Invoke-Command -ComputerName dc01,srv01,srv02 -ScriptBlock{
   if ((Test-Path c:\scripts\planets) -eq $false){new-item -path c:\scripts\planets -ItemType Directory}
}

Invoke-Command -ComputerName dc01,srv01,srv02 -ScriptBlock{
    $spool = get-service spooler
    if ($spool.status -eq "stopped"){Start-Service}
}


$cred = Get-Credential 714tech\bob
Invoke-Command -ComputerName dc01,srv01,srv02 -ScriptBlock{
    get-service bits | restart-service
} -Credential $cred

get-adcomputer -filter * -searchbase "ou=servers","dc=714tech","dc=local"

$servers = get-adcomputer -filter * -searchbase "ou=servers,dc=714tech,dc=local" | select -ExpandProperty name
invoke-command -computername (get-adcomputer -filter * -searchbase "ou=servers,dc=714tech,dc=local" | select -ExpandProperty name) -ScriptBlock {restart-service spooler}
invoke-command -computer (get-content C:\Scripts\TMFeb2025\servers.txt) -ScriptBlock {$env:COMPUTERNAME}

Get-PSSessionConfiguration

Enter-PSSession -ComputerName srv01 -ConfigurationName "PowerShell.7"

https://www.thomasmaurer.ch/2020/04/enable-powershell-ssh-remoting-in-powershell-7/

# Install the OpenSSH Client and Server
 
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
 
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
 
# Initial Configuration of SSH Server
 
Start-Service sshd
 
Set-Service -Name sshd -StartupType 'Automatic'
 
# Confirm the Firewall rule is configured. It should be created automatically by setup.
 
Get-NetFirewallRule -Name *ssh*
 
# There should be a firewall rule named "OpenSSH-Server-In-TCP", which should be enabled


Enter-PSSession -HostName srv01 -UserName bob
invoke-command -HostName srv01 -ScriptBlock {$env:COMPUTERNAME}
