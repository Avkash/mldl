

Here is the full main.java code for Scoring with GLM Regression Model:

```
import java.io.*;
import java.util.Arrays;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;

public class main {
  private static String modelClassName = "glm_35a853f9_91f4_4251_ba8e_f84cab3b06cf";

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
