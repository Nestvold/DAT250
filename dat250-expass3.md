# DAT250: Software Technology Experiment Assignment 3
## Experiment 1: MongoDB CRUD operations
### Technical issues:
During this tutorial I did not encouter any problems. Setting path etc for `mongosh` was easy considering we had to do the same for `Maven`.

### Correct installation
I created a PowerShell script called `checkSignatures.ps1` and ran it, however for some reason it would not access the `mongodb-windows-x86_64-5.0.2-signed.msi.sha256` file, so i were not able to run the script successfully. However i was able to get retrive the `SHA256` hash computed from the MongoDB binary i downloaded and compared it to the `SHA256` hash i downloaded directly from MongoDB and they were a match.

```
$sigHash = (Get-Content $Env:HomePath\Downloads\mongodb-windows-x86_64-5.0.2-signed.msi.sha256 | Out-String).SubString(0,64).ToUpper(); `
$fileHash = (Get-FileHash $Env:HomePath\Downloads\mongodb-windows-x86_64-5.0.2-signed.msi).Hash.Trim(); `
Write-Output $sigHash; `
Write-Output $fileHash; `
$sigHash -eq $fileHash
```

<img src="extra\signatureCheck.JPG">


### Tutorial: Insert Documents
<img src="extra\insert.JPG" width="400">

### Tutorial: Query Documents
<img src="extra\update.JPG" width="400">

### Tutorial: Update Documents
<img src="extra\query.JPG" width="400">

### Tutorial: Remove Documents
<img src="extra\delete.JPG" width="400">


## Experiment 2: Aggregation 


example working and the additional Map-reduce operation (and its result) developed by each of you.

Reason about why your implemented Map-reduce operation in Experiment 2 is useful and interpret the collection obtained.

Any pending issues with this assignment which you did not manage to solve

