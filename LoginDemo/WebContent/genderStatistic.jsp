<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page  import="java.awt.*" %>
 <%@ page import= "management.UserManagement" %>

            <%@ page  import="java.io.*" %>
               <%@ page  import="org.jfree.chart.*" %>
            <%@ page  import="org.jfree.chart.entity.*" %>
             <%@ page  import ="org.jfree.data.general.*"%>
              <%
             final UserManagement user= new UserManagement();	
            final DefaultPieDataset data = new DefaultPieDataset();

             data.setValue("female", (user.femaleAnzahl()));
            data.setValue("male", (user.maleAnzahl()));
              

              JFreeChart chart = ChartFactory.createPieChart
              ("Gender Statistics ", data, true, true, false);

              try {
              final ChartRenderingInfo info = new 
                   ChartRenderingInfo(new StandardEntityCollection());
                   
              final File file1 = new File( getServletContext().getRealPath("/")+"images/piechart.png");

            ChartUtilities.saveChartAsPNG(
            file1, chart, 800, 600, info);
              } catch (Exception e) {
            out.println(e);
              }
           %>
            <html>
           <head>
             <meta http-equiv="Content-Type" 
             content="text/html; charset=UTF-8">
             <title>JSP Page</title>
            </head>
            <body>
                <IMG SRC="images/piechart.png" WIDTH="800" HEIGHT="600" 
           BORDER="0" USEMAP="#chart">
                
                '<a href="images/piechart.png" height="20" width="20" download/><img src="images/tab_img.jpg" alt=" Image " title="Click to download" height="20" width="20" /></a>',
           </body>
            </html> 
