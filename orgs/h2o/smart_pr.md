## H2O Pull Requests with great details of learning ##

### Word2Vec Development ###
```
You can view, comment on, or merge this pull request online at:
  https://github.com/h2oai/h2o-3/pull/632
Commit Summary
	•	Fix bug in BufferedString.write_impl(), only worked for _buf.length==_len
	•	word2vec: revised implementation
	•	Extends Scope: enables tracking of generic Keyed classes
	•	ArrayUtils.add: java version of BLAS.saxpy
File Changes
	•	M h2o-algos/src/main/java/hex/api/RegisterAlgos.java (5)
	•	A h2o-algos/src/main/java/hex/api/Word2VecHandler.java (37)
	•	D h2o-algos/src/main/java/hex/schemas/SynonymV3.java (27)
	•	A h2o-algos/src/main/java/hex/schemas/Word2VecSynonymsV3.java (19)
	•	M h2o-algos/src/main/java/hex/schemas/Word2VecV3.java (29)
	•	A h2o-algos/src/main/java/hex/word2vec/HBWTree.java (93)
	•	M h2o-algos/src/main/java/hex/word2vec/Word2Vec.java (71)
	•	M h2o-algos/src/main/java/hex/word2vec/Word2VecModel.java (504)
	•	M h2o-algos/src/main/java/hex/word2vec/WordCountTask.java (253)
	•	M h2o-algos/src/main/java/hex/word2vec/WordVectorTrainer.java (485)
	•	M h2o-algos/src/test/java/hex/AAA_PreCloudLock.java (2)
	•	A h2o-algos/src/test/java/hex/word2vec/HBWTreeTest.java (15)
	•	M h2o-algos/src/test/java/hex/word2vec/Word2VecTest.java (205)
	•	A h2o-algos/src/test/java/hex/word2vec/WordCountTaskTest.java (34)
	•	M h2o-core/src/main/java/water/Scope.java (7)
	•	M h2o-core/src/main/java/water/parser/BufferedString.java (4)
	•	M h2o-core/src/main/java/water/util/ArrayUtils.java (4)
	•	A h2o-core/src/test/java/water/ScopeTest.java (35)
	•	M h2o-core/src/test/java/water/util/ArrayUtilsTest.java (19)
	•	M h2o-r/h2o-package/R/constants.R (6)
	•	M h2o-r/h2o-package/R/word2vec.R (97)
	•	D h2o-r/tests/testdir_algos/word2vec/runit_NOPASS_text8_test_large.R (31)
	•	A h2o-r/tests/testdir_algos/word2vec/runit_text8_test_large.R (21)
Patch Links:
	•	https://github.com/h2oai/h2o-3/pull/632.patch
	•	https://github.com/h2oai/h2o-3/pull/632.diff

```
### Deep Learning MOJO ###
```
```

