# Scoring with POJO Models in Java #

Here are the key steps you will perform to score with H2O POJO models:

1. Get your POJO model (Java code) integrated as class name into your Java Code
2. After that you  need to create a new instance of your POJO class in your code
3. After it, you would select the prediction class based on your prediction type 
   2.1 BinomialModelPrediction 
   2.2 MultinomialModelPrediction 
   2.3 RegressionModelPrediction 
   2.4 ClusteringModelPrediction 
   2.5 AutoEncoderModelPrediction 
   2.6 Word2VecPrediction
4. You would need to pass each row for predition with above prediction function in the RowData format 
   4.1 If you want to perform batch scoring, you will have to loop through all the rows one by one as RowData
5. After chooing the porper prediction type, you would need to pass the RowData object to perform prediction

Note: Only 1 & 2 step is different in POJO comparision to MOJO, however remaining steps are same.

## Sample Java code to score (Binomial Prediction) with POJO Models ##

Following is the sample Java code to perform prediction using a binomial POJO model (i.e. gbm_model.java):
```
import java.io.*;
import java.util.Arrays;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;

public class main {
  private static String modelClassName = "gbm_model";

  public static void main(String[] args) throws Exception {

    hex.genmodel.GenModel rawModel;
    rawModel = (hex.genmodel.GenModel) Class.forName(modelClassName).newInstance();

    System.out.println("isSupervised : " + rawModel.isSupervised());
    System.out.println("Column Names : " + Arrays.toString(rawModel.getNames()));
    System.out.println("Response ID : " + rawModel.getResponseIdx());
    System.out.println("Number of columns : " + rawModel.getNumCols());
    //System.out.println("Response Name : " + rawModel.getResponseName());

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

## Sample Java code to score (Regresssion Prediction) with POJO Models ##

Following is the sample Java code to perform regression prediction using POJO model (i.e. glm_model.java):
```
import java.io.*;
import java.util.Arrays;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;

public class main {
  private static String modelClassName = "glm_model";

  public static void main(String[] args) throws Exception {

    hex.genmodel.GenModel rawModel;
    rawModel = (hex.genmodel.GenModel) Class.forName(modelClassName).newInstance();

    System.out.println("isSupervised : " + rawModel.isSupervised());
    System.out.println("Model UUID : " + rawModel.getUUID());
    System.out.println("Column Names : " + Arrays.toString(rawModel.getNames()));
    System.out.println("Response ID : " + rawModel.getResponseIdx());
    System.out.println("Number of columns : " + rawModel.getNumCols());
    //System.out.println("Response Name : " + rawModel.getResponseName());
    System.out.println("isClassifier : " + rawModel.isClassifier());
    if (rawModel.isClassifier()) {  
      System.out.println("Response Classes : " + rawModel.getNumResponseClasses());      
    }

    for (int i = 0; i < rawModel.getNumCols(); i++) {
      String[] domainValues = rawModel.getDomainValues(i);
      System.out.println(Arrays.toString(domainValues));
    }

    EasyPredictModelWrapper model = new EasyPredictModelWrapper(rawModel);


    RowData row = new RowData();
    row.put("AGE", "60");
    row.put("RACE", "0");
    row.put("DCAPS", "1");
    row.put("VOL", "0");
    row.put("GLEASON", "5");

    RegressionModelPrediction p = model.predictRegression(row);
    System.out.println("Values: " + p.value);
    System.out.println("");
  }
}

```
