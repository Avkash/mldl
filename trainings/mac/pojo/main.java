import java.io.*;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;

public class main {
  private static String modelClassName = "model_mpg";

  public static void main(String[] args) throws Exception {
    hex.genmodel.GenModel rawModel;
    rawModel = (hex.genmodel.GenModel) Class.forName(modelClassName).newInstance();
    EasyPredictModelWrapper model = new EasyPredictModelWrapper(rawModel);

    RowData row = new RowData();
    row.put("cylinders", "120");
    row.put("displacement", "210");
    row.put("horsepower", "100");
    row.put("weight", "10000");
    row.put("acceleration", "12");
    row.put("modelyear", "1980");
    row.put("origin", "1");

    RegressionModelPrediction p = model.predictRegression(row);
    System.out.println("Results: " + p.value);
  }
}