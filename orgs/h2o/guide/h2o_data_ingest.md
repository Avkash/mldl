# H2O Data Ingest #

### <span style="color:blue">Supported file format</span> ###
H2O supports the following different file types:
 - CSV (delimited) files
 - ORC
 - SVMLight
 - ARFF
 - XLS
 - XLSX
 - Avro version 1.8.0 (without multifile parsing or column type modification)
 - Parquet (Some of the complex nested parquet files may not be read properly)

### Supported Data Types ###
H2O supports the following data types:
- Numeric
- String
- Enum
- Time
- UUID
H2O will also mark some of the data as invalid or unknown if could not set any of the above data type.



