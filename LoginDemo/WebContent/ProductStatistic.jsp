<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <%@ page  import="java.awt.*" %>
 <%@ page  import="java.util.*" %>
 <%@ page import= "management.*" %>
 <%@ page import= "beans.*" %>
 <%@ page import= "AuktionDAO.*" %>
            <%@ page  import="java.io.*" %>
               <%@ page  import="org.jfree.chart.*" %>
            <%@ page  import="org.jfree.chart.entity.*" %>
             <%@ page  import ="org.jfree.data.general.*"%>
              <%
           
            DefaultPieDataset data = new DefaultPieDataset();
            
             ArrayList<Produkt> produktList=new ArrayList<Produkt>();
           ProduktSerializierung produktY=new ProduktSerializierung();
           CategorySerializierung categoryY=new CategorySerializierung();
            ArrayList<Category> categoryList=new ArrayList<Category>();
           int[] zahl  = new int[50];
           int i=0;
           produktList=produktY.getProduktList();
           categoryList=categoryY.getCategoryList();
           for( i = 0; i<categoryList.size(); i++){
        	   for(Produkt produkt: produktList){
        		  if ((produkt.getCategory()).equalsIgnoreCase(((categoryList.get(i)).getName()))) 
        	   zahl[i] ++; }
        	  }
           for( i = 0; i<categoryList.size(); i++){
           data.setValue(((categoryList.get(i)).getName()), zahl[i]);}
           
           
              JFreeChart chart = ChartFactory.createPieChart
              ("Product Statistics ", data, true, true, false);

              try {
              final ChartRenderingInfo info = new 
                   ChartRenderingInfo(new StandardEntityCollection());

              final File file1 = new File( getServletContext().getRealPath("/")+"images/statistik.png");
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
             <IMG SRC="images/statistik.png" WIDTH="800" HEIGHT="600" 
           BORDER="0" USEMAP="#chart">
             '<a href="images/statistik.png" height="20" width="20" download/><img src="images/tab_img.jpg" alt=" Image " title="Click to download" height="20" width="20" /></a>',
           </body>
            </html> 
