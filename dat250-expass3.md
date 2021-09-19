# DAT250: Software Technology Experiment Assignment 3

## Experiment 1: MongoDB CRUD operations

### Technical issues:
During this tutorial I did not encouter any problems. Setting path etc for `mongosh` was easy considering we had to do the same for `Maven`. However i managed to save the `mongodb-windows-x86_64-5.0.2-signed.msi` as wrong filetype and that caused some irritation.


### Correct installation
I created a PowerShell script called [`checkSignaturesMongoDB.ps1`](extra\checkSignatures.ps1) and ran it. I was able to get retrive the `SHA256 hash` computed from the MongoDB binary i downloaded and compared it to the `SHA256 hash` i downloaded directly from MongoDB and they were a match.

<img src="extra\signatureCheck.JPG" width="600">


### Tutorial: Insert Documents
<img src="extra\insert.JPG">


### Tutorial: Query Documents
<img src="extra\query.JPG">


### Tutorial: Update Documents
<img src="extra\update.JPG">


### Tutorial: Remove Documents
<img src="extra\delete.JPG">

### Tutorial: Bulk Write
<img src="extra\bulkWrite.JPG">

## Experiment 2: Aggregation 

### Map-reduce
<img src="extra\map_reduce.JPG" >

## Own function
I though it would be useful to see the daily income based on sales (without costs that is).
