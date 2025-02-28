Get-ExecutionPolicy 


.\demo1.ps1

.\demo2.ps1

#remove it if we need to
remove-item Cert:\CurrentUser\my\0AA1ECA209F1A3B943BC84BEF19CDF163E3B8962

.\demo3_MakeCert.ps1

#Check for certs
Get-ChildItem cert:\CurrentUser\my -codesigning

#Signs the cert
.\SignCode.ps1 -File .\demo2.ps1

code .\demo2.ps1

.\demo2.ps1