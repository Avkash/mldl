import java.io.*;
import hex.genmodel.easy.RowData;
import hex.genmodel.easy.EasyPredictModelWrapper;
import hex.genmodel.easy.prediction.*;
import hex.genmodel.MojoModel;

public class main {
  private static String modelClassName = "model_mpg";

  public static void main(String[] args) throws Exception {
    EasyPredictModelWrapper model = new EasyPredictModelWrapper(MojoModel.load("model_mpg.zip"));

    RowData row = new RowData();
    row.put("cylinders", "120");
    row.put("displacement", "210");
    row.put("horsepower", "500");
    row.put("weight", "10000");
    row.put("acceleration", "12");
    row.put("modelyear", "1970");
    row.put("origin", "1");

    RegressionModelPrediction p = model.predictRegression(row);
    System.out.println("Results: " + p.value);
  }
}