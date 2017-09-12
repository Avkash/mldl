
Here is the full java code for scoring with POJO GBM Binomial Model:

```
// K-means Sample
import java.io.*;
import java.util.Arrays;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;

import hex.kmeans.KMeans;
import hex.kmeans.KMeansModel;
import hex.kmeans.KMeansModel.KMeansParameters;
import java.io.File;

public class main {
  private static String modelClassName = "gbm_prostate_new";

  public static void main(String[] args) throws Exception {

    hex.genmodel.GenModel rawModel;
    rawModel = (hex.genmodel.GenModel) Class.forName(modelClassName).newInstance();

    System.out.println("isSupervised : " + rawModel.isSupervised());
    System.out.println("Column Names : " + Arrays.toString(rawModel.getNames()));
    System.out.println("Response ID : " + rawModel.getResponseIdx());
    System.out.println("Number of columns : " + rawModel.getNumCols());
    System.out.println("Response Name : " + rawModel.getResponseName());

    for (int i = 0; i < rawModel.getNumCols(); i++) {
      String[] domainValues = rawModel.getDomainValues(i);
      System.out.println(Arrays.toString(domainValues));
    }

    EasyPredictModelWrapper model = new EasyPredictModelWrapper(rawModel);


    RowData row = new RowData();
    row.put("AGE", "68");
    row.put("RACE", "2");
    row.put("DCAPS", "2");
    row.put("VOL", "0");
    row.put("GLEASON", "6");

    BinomialModelPrediction p = model.predictBinomial(row);
    System.out.println("Has penetrated the prostatic capsule (1=yes; 0=no): " + p.label);
    System.out.print("Class probabilities: ");
    for (int i = 0; i < p.classProbabilities.length; i++) {
      if (i > 0) {
	System.out.print(",");
      }
      System.out.print(p.classProbabilities[i]);
    }
    System.out.println("");
  }
}


```
