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
 5 == 5
 5<> 5

 5 -eq 5
 5 -ne 5 
 5 -gt 5
 5 -ge 5


 https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_comparison_operators?view=powershell-7.5
"cat" -eq "CAT"
"cat" -ceq "CAT"

$array = "cat","dog","lizard"
"cat" -in $array