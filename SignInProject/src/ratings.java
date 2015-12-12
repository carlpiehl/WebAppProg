

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

/**
 * Servlet implementation class ratings
 */
@WebServlet("/ratings")
public class ratings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ratings() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		 Connection connection = null;
		  String url = "jdbc:mysql://localhost:3306/";
		  String dbName = "store_db";
		  String driver = "com.mysql.jdbc.Driver";
		  String uname = "root";
		  String pass = "root";
		  ResultSet result = null;
		  PreparedStatement pst = null;
		  ResultSetMetaData rsmd = null;
		  String productID = request.getParameter("productID");
		  try {
			  Class.forName(driver).newInstance();
			  connection = DriverManager.getConnection(url + dbName, uname, pass);
			  pst = connection.prepareStatement("INSERT INTO review (rating, fk_user, products_pk_product) VALUES (?, 1, ?)");
			  pst.setString(1, (String) request.getAttribute("rating"));
			  pst.setString(2, productID);
		 	  pst.execute();
			  pst = connection.prepareStatement("SELECT * FROM review WHERE products_pk_product = ?");
			  pst.setString(1, "1");
			  result = pst.executeQuery();
			  int rating = 0;
			  int amount = 0;
			  int tempRating = 0;
			  while (result.next()) {
			  	rating += Integer.parseInt(result.getString("rating"));
			  	amount++;
			  }
			  if (amount != 0){
			  	tempRating = rating / amount;
			  } else {
				  tempRating = 0;
			  }
			  pst = connection.prepareStatement("UPDATE products SET rating = ? WHERE pk_product = ?");
			  pst.setString(1, "" + tempRating);
			  pst.setString(2, productID);
			  pst.execute();
		  }catch(Exception e){response.getWriter().write("EVERYTHING IS MESSED UP!");}
		  response.sendRedirect("fullProduct.jsp?productID=" + productID);
	}

}