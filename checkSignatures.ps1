$sigHash = (Get-Content $Env:HomePath\Downloads\mongodb-windows-x86_64-5.0.2-signed.msi.sha256 | Out-String).SubString(0,64).ToUpper(); `
$fileHash = (Get-FileHash $Env:HomePath\Downloads\mongodb-windows-x86_64-5.0.2-signed.msi).Hash.Trim(); `
Write-Output $sigHash; `
Write-Output $fileHash; `
$sigHash -eq $fileHash