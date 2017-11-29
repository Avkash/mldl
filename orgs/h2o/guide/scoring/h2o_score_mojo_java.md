# Scoring with MOJO Models in Java #

Here are the key steps you will perform to score with H2O MOJO models:

1. Get your MOJO model (zip file) loaded as resource using EasyPredictModelWrapper Class
2. After model is loaded, you need to select the prediction class based on your prediction type
   2.1 BinomialModelPrediction
   2.2 MultinomialModelPrediction
   2.3 RegressionModelPrediction
   2.4 ClusteringModelPrediction
   2.5 AutoEncoderModelPrediction
   2.6 Word2VecPrediction
3. You would need to pass each row for predition with above prediction function in the RowData format
   3.1 If you want to perform batch scoring, you will have to loop through all the rows one by one as RowData
4. After chooing the porper prediction type, you would need to pass the RowData object to perform prediction


## Sample Java code to score (Binomial Prediction) with  MOJO Models ###

Following is the sample Java code to perform prediction using a binomial MOJO model:

```
import java.io.*;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;
import hex.genmodel.MojoModel;
import java.util.Arrays;

public class main {
  public static void main(String[] args) throws Exception {
    EasyPredictModelWrapper model = new EasyPredictModelWrapper(MojoModel.load("gbm_prostate_new.zip"));

    hex.genmodel.GenModel mojo = MojoModel.load("gbm_prostate_new.zip");

    System.out.println("isSupervised : " + mojo.isSupervised());
    System.out.println("Columns Names : " + Arrays.toString(mojo.getNames()));
    System.out.println("Number of columns : " + mojo.getNumCols());
    System.out.println("Response ID : " + mojo.getResponseIdx());
    System.out.println("Response Name : " + mojo.getResponseName());

    for (int i = 0; i < mojo.getNumCols(); i++) {
      String[] domainValues = mojo.getDomainValues(i);
      System.out.println(Arrays.toString(domainValues));
    }

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

## Sample Java code to score (Regresssion Prediction) with  MOJO Models ###

Following is the sample Java code to perform regression prediction using  MOJO model:

```
import java.io.*;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;
import hex.genmodel.MojoModel;
import java.util.Arrays;

public class main {
  public static void main(String[] args) throws Exception {
    EasyPredictModelWrapper model = new EasyPredictModelWrapper(MojoModel.load("glm_model.zip"));

    RowData row = new RowData();
    row.put("AGE", "68");
    row.put("RACE", "2");
    row.put("DCAPS", "2");
    row.put("VOL", "0");
    row.put("GLEASON", "6");

    RegressionModelPrediction p = model.predictRegression(row);
    System.out.println("Values: " + p.value);
    System.out.println("");
  }
}
```

