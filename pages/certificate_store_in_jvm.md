First Get the Certificate from the server (or Localhost) you would want to install:

## Getting certificate (either from localhost of an URL) to local machine
```
$ java InstallCert ec2_ADDRESS_URL:8243

Loading KeyStore /Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home/jre/lib/security/cacerts...
Opening connection to ec2_ADDRESS_URL:8243 ...
Starting SSL handshake...

Server sent 1 certificate(s):

 1 Subject CN=localhost, OU=WSO2, O=WSO2, L=Mountain View, ST=CA, C=US
   Issuer  CN=localhost, OU=WSO2, O=WSO2, L=Mountain View, ST=CA, C=US
   sha1    57 ff 38 d9 76 64 c7 92 ff 88 01 17 1f 04 19 1d ed 88 77 8d
   md5     72 2a bf 36 2d 0d e5 87 6d 53 e9 6c 92 a1 a5 50

Enter certificate to add to trusted keystore or 'q' to quit: [1]


[
[
  Version: V3
  Subject: CN=localhost, OU=WSO2, O=WSO2, L=Mountain View, ST=CA, C=US
  Signature Algorithm: SHA256withRSA, OID = 1.2.840.113549.1.1.11

  Key:  Sun RSA public key, 2048 bits
  params: null
  modulus: .....................
  public exponent: 65537
  Validity: [From: Wed Oct 23 00:30:43 PDT 2019,
               To: Mon Jan 24 23:30:43 PST 2022]
  Issuer: CN=localhost, OU=WSO2, O=WSO2, L=Mountain View, ST=CA, C=US
  SerialNumber: [    XXXXXXXXX]

Certificate Extensions: 4
[1]: ObjectId: 2.5.29.37 Criticality=false
ExtendedKeyUsages [
  serverAuth
  clientAuth
]

[2]: ObjectId: 2.5.29.15 Criticality=false
KeyUsage [
  DigitalSignature
  Non_repudiation
  Key_Encipherment
  Data_Encipherment
]

[3]: ObjectId: 2.5.29.17 Criticality=false
SubjectAlternativeName [
  DNSName: localhost
]

[4]: ObjectId: 2.5.29.14 Criticality=false
SubjectKeyIdentifier [
KeyIdentifier [
0000: 40 E9 2C 1E 0F 0E 0C EC   77 10 F6 15 5D EB 56 73  @.,.....w...].Vs
0010: AB FC 0D 03                                        ....
]
]

]
  Algorithm: [SHA256withRSA]
  Signature:
.......

]

Added certificate to keystore 'jssecacerts' using alias 'ec2_ADDRESS_URL-1'
```
Note: Above step generate a file name jssecacerts after its execution.

## Exporting Certificate into local keystore
Now we will export the cert as below:
```
$ keytool 
  -exportcert 
  -alias ec2_ADDRESS_URL-1 
  -keystore jssecacerts -storepass changeit 
  -file ec2_ADDRESS_FILE.cer
  
  
Certificate stored in file <ec2_ADDRESS_URL.cer>
```

```
$ sudo keytool -importcert 
   -alias ec2_ADDRESS_URL-1 
   -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home/jre/lib/security/cacerts 
   -storepass changeit 
   -file ec2_ADDRESS_URL.cer
   
```

## List all certificates in a keystore
```
$ keytool -list -v -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home/jre/lib/security/cacerts

### Search by ec2 
$ keytool -list -v -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home/jre/lib/security/cacerts | grep ec2 

```

## Delete a specific certificate from the keystore
```
### first find the alias
$ keytool -list -v -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home/jre/lib/security/cacerts | grep localhost

### Now delete the certificate 
$ sudo keytool -delete -alias localhost  -v -keystore /Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home/jre/lib/security/cacerts

Note: If you havent change the password the default password is changeit

### Verify if the certificate deleted sucessfully.
```


