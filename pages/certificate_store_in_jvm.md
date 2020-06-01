First Get the Certificate from the server (or Localhost) you would want to install:

```
$ java InstallCert ec2_ADDRESS_URL:8243

Loading KeyStore /Library/Java/JavaVirtualMachines/jdk1.8.0_251.jdk/Contents/Home/jre/lib/security/cacerts...
Opening connection to ec2_ADDRESS_URL:8243 ...
Starting SSL handshake...

javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
	at sun.security.ssl.Alerts.getSSLException(Alerts.java:198)
	at sun.security.ssl.SSLSocketImpl.fatal(SSLSocketImpl.java:1967)
	at sun.security.ssl.Handshaker.fatalSE(Handshaker.java:331)
	at sun.security.ssl.Handshaker.fatalSE(Handshaker.java:325)
	at sun.security.ssl.ClientHandshaker.serverCertificate(ClientHandshaker.java:1689)
	at sun.security.ssl.ClientHandshaker.processMessage(ClientHandshaker.java:226)
	at sun.security.ssl.Handshaker.processLoop(Handshaker.java:1082)
	at sun.security.ssl.Handshaker.process_record(Handshaker.java:1010)
	at sun.security.ssl.SSLSocketImpl.readRecord(SSLSocketImpl.java:1079)
	at sun.security.ssl.SSLSocketImpl.performInitialHandshake(SSLSocketImpl.java:1388)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1416)
	at sun.security.ssl.SSLSocketImpl.startHandshake(SSLSocketImpl.java:1400)
	at InstallCert.main(InstallCert.java:146)
Caused by: sun.security.validator.ValidatorException: PKIX path building failed: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
	at sun.security.validator.PKIXValidator.doBuild(PKIXValidator.java:450)
	at sun.security.validator.PKIXValidator.engineValidate(PKIXValidator.java:317)
	at sun.security.validator.Validator.validate(Validator.java:262)
	at sun.security.ssl.X509TrustManagerImpl.validate(X509TrustManagerImpl.java:330)
	at sun.security.ssl.X509TrustManagerImpl.checkTrusted(X509TrustManagerImpl.java:235)
	at sun.security.ssl.X509TrustManagerImpl.checkServerTrusted(X509TrustManagerImpl.java:113)
	at InstallCert$SavingTrustManager.checkServerTrusted(InstallCert.java:238)
	at sun.security.ssl.AbstractTrustManagerWrapper.checkServerTrusted(SSLContextImpl.java:1099)
	at sun.security.ssl.ClientHandshaker.serverCertificate(ClientHandshaker.java:1671)
	... 8 more
Caused by: sun.security.provider.certpath.SunCertPathBuilderException: unable to find valid certification path to requested target
	at sun.security.provider.certpath.SunCertPathBuilder.build(SunCertPathBuilder.java:141)
	at sun.security.provider.certpath.SunCertPathBuilder.engineBuild(SunCertPathBuilder.java:126)
	at java.security.cert.CertPathBuilder.build(CertPathBuilder.java:280)
	at sun.security.validator.PKIXValidator.doBuild(PKIXValidator.java:445)
	... 16 more

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
  modulus: 24984660151808520742855864359284331493330185690637074451190465696683576934511308424669986615869725478751410514222172363080314477318498109055608688225653996165083182732402409820919663596127595258149447968992697755300818048326576744061458852231291483643994178920470658295560234029174596375587952520363058611926372560725889946737811202969735197814606943089599400765451331602175378902123041254417662829363878110564648589626405453904945691740995649005986679319013698464544677105297598541227935992248970267659913147553520350710627179751070690167955309835371022291019136785255640817324263333975650439939419998221641450073403
  public exponent: 65537
  Validity: [From: Wed Oct 23 00:30:43 PDT 2019,
               To: Mon Jan 24 23:30:43 PST 2022]
  Issuer: CN=localhost, OU=WSO2, O=WSO2, L=Mountain View, ST=CA, C=US
  SerialNumber: [    5db001a3]

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
0000: 4F 07 FD AC 40 81 78 ED   F7 71 C6 09 81 AE 99 42  O...@.x..q.....B
0010: D6 DA 52 A4 82 A1 2F 5E   BC 8F D9 09 11 A5 BC 90  ..R.../^........
0020: 4A C4 D8 70 BE D9 2D 25   41 EC C5 55 1E D2 2C 1E  J..p..-%A..U..,.
0030: 1F 1F D4 2E 17 AB A4 2E   F0 D5 2B AA EE 59 2C 2D  ..........+..Y,-
0040: 69 50 1C 9A A9 1D 99 23   37 23 FC E5 8B 19 84 63  iP.....#7#.....c
0050: 49 31 D2 56 65 48 AB D4   2A 06 AD 63 EE BE 9F DC  I1.VeH..*..c....
0060: 15 AA 68 E2 22 92 79 93   CC 4B AA 21 59 4E 4D 8D  ..h.".y..K.!YNM.
0070: 20 3B E4 87 75 2E B6 BE   BD 85 0B 3E 32 3A B0 44   ;..u......>2:.D
0080: BA 51 80 BE 89 AC 53 CB   2A 83 83 E1 16 79 21 C4  .Q....S.*....y!.
0090: 8E 0C F7 5D 8B CB ED 91   80 DF 4B EC 09 21 CC AF  ...]......K..!..
00A0: 84 CD 76 35 FD 0B 65 23   F5 72 B0 D7 D2 EB 3A C7  ..v5..e#.r....:.
00B0: 6A C2 B3 E8 2A CA 28 21   AA 42 70 67 4A F4 93 C8  j...*.(!.BpgJ...
00C0: 5F 4E 47 92 85 1E 79 00   C0 4F 7D E4 86 6B 71 24  _NG...y..O...kq$
00D0: 22 70 CC 6C 2E 14 CC 50   70 CB 43 F8 11 CB 2E D5  "p.l...Pp.C.....
00E0: FD 9A 43 31 F0 16 47 EE   4E 79 08 8D 02 9F DB 1B  ..C1..G.Ny......
00F0: 87 E3 26 84 DD A2 A9 2E   97 9D 7E D9 B1 C7 56 B5  ..&...........V.

]

Added certificate to keystore 'jssecacerts' using alias 'ec2_ADDRESS_URL-1'
```
Note: Above step generate a file name jssecacerts after its execution.

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
