# Ingesting Data from S3 from Java API #

The following code snippet shows how to ingest dataset from S3 in Java API:
```
Key k = H2O.getPM().anyURIToKey(new URI("s3://h2o-public-test-data/smalldata/airlines/AirlinesTrain.csv.zip"));
Frame f = ParseDataset.parse(Key.make(), k);
System.out.println(f.toTwoDimTable().toString());
```

And the result will be as below:
```
Frame _a5f6a7ff404d46d91f15ce12913c4a41 (24421 rows and 12 cols):
         fYear fMonth fDayofMonth fDayOfWeek DepTime ArrTime UniqueCarrier Origin Dest Distance IsDepDelayed IsDepDelayed_REC
    min 5 1 11 -1
   mean 1325.4553458089351 1489.697882969578 755.579705990743 0.0937308054543217
 stddev 456.12883112978403 471.177557164966 630.7189956861423 0.9956179620641292
    max 2400 2400 3365 1
missing 0 0 0 0
      0 f1987 f10 f14 f3 741 912 PS SAN SFO 447 YES 1
      1 f1987 f10 f18 f7 729 847 PS SAN SFO 447 NO -1
      2 f1987 f10 f19 f1 749 922 PS SAN SFO 447 YES 1
      3 f1987 f10 f21 f3 728 848 PS SAN SFO 447 NO -1
      4 f1987 f10 f23 f5 731 902 PS SAN SFO 447 YES 1
      5 f1987 f10 f24 f6 744 908 PS SAN SFO 447 YES 1
      6 f1987 f10 f25 f7 729 851 PS SAN SFO 447 NO -1
      7 f1987 f10 f26 f1 735 904 PS SAN SFO 447 YES 1
      8 f1987 f10 f28 f3 741 919 PS SAN SFO 447 YES 1
      9 f1987 f10 f29 f4 742 906 PS SAN SFO 447 YES 1
```

Note: You must set AWS Credentials correctly in one of the supported ways. 
