## Netezza Tips and Tricks ##


### Connecting Netezza server from Java Code Sample ###

Step 1: Have the Netezza driver as nzjdbc3.jar in a foler.
Step 2: Create netezzaJdbcMain.java as below in the same folder where nzjdbc3.jar is placed.

```
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
public class netezzaJdbcMain {
    public static void main(String[] args) {
        String server = "x.x.x.x";
        String port = "5480";
        String dbName = "_db_name_";
        String url = "jdbc:netezza://" + server + "/" + dbName ;
        String user = "admin";
        String pwd = "password";
        String schema = "db_schema";
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            Class.forName("org.netezza.Driver");
            System.out.println(" Connecting ... ");
            conn = DriverManager.getConnection(url, user, pwd);
            System.out.println(" Connected "+conn);
            
            String sql = "select * from allusers";
            st = conn.createStatement();
            rs = st.executeQuery(sql);

            System.out.println("Printing result...");
            int i = 0;
            while (rs.next()) {
                String userName = rs.getString("name");
                int year = rs.getInt("age");
                System.out.println("User: " + userName +
                        ", age is: " + year);
                i++;
            }
            if (i==0){
                System.out.println(" No data found");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if( rs != null) 
                    rs.close();
                if( st!= null)
                    st.close();
                if( conn != null)
                    conn.close();
            } catch (SQLException e1) {
                    e1.printStackTrace();
                }
        }
    }
}
```
Step 3: Compile code as below:
```
$ javac -cp nzjdbc3.jar -J-Xmx2g -J-XX:MaxPermSize=128m netezzaJdbcMin.java                                                                                                                                
Java HotSpot(TM) 64-Bit Server VM warning: ignoring option MaxPermSize=128m; support was removed in 8.0
```
Note: You should see your main class is compiled without any problem.
Step 4: Run compiled class as below:

```
$ java -cp .:nzjdbc3.jar netezzaJdbcMain

 Connecting ...
 Connected org.netezza.sql.NzConnection@3feba861
Printing result...
User: John                , age is: 30
User: Jason               , age is: 26
User: Jim                 , age is: 20
User: Kyle                , age is: 21
User: Kim                 , age is: 27

```
Note: You will see results something as above. 
