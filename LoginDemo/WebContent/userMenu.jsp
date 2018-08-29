<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <style type="text/css">body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
        <style>
            select {
                border: 0 none;
                color: black;
                background: #87CEFA;
                font-size: 20px;
                font-weight: bold;
                padding: 2px 10px;
                width: 378px;

            }
            #mainselection {
                overflow: hidden;
                width: 350px;
                -moz-border-radius: 9px 9px 9px 9px;
                -webkit-border-radius: 9px 9px 9px 9px;
                border-radius: 9px 9px 9px 9px;
                box-shadow: 1px 1px 11px #330033;
                background: #87CEFA;
            }
            button {
                background-color: #87CEFA;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: auto;
            }

            ul {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #FFFAFA;;
            }

            li {
                float: left;
            }

            li a {
                display: block;
                color: black;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            li a:hover {
                background-color: #FFF5EE;
            }
        </style>
        <title>Welcome UsernPage</title> 
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
        <%@ page import= "AuktionDAO.CategorySerializierung" %>
        <%@ page import= "java.util.*" %>
        <%@ page import= "beans.*" %> 
        <%@ page import= "AuktionDAO.*" %> 
    </head>   
    <body> 
        <img src="images/logo1.jpg" alt="Mountain View" style="width:auto;height:auto;">  
        <ul>
            <li> 
                <form method="post" action="SearchByCategory" >
                    <select id="mainselection" name="category" > 
                        <option value="-1">-Select Category-</option>

                        <%
                            CategorySerializierung category = new CategorySerializierung();
                            ArrayList<Category> categoryList = new ArrayList<Category>();
                            categoryList = category.getCategoryList();
                            for (Category produktSuchen : categoryList) {
                        %>
                        <option value="<%out.print(produktSuchen.getName());%>"><%out.print(produktSuchen.getName());%></option><% }%>
                    </select>

                    <button type="submit" >Search Product</button>
                </form>
            </li> 
            <li><a href="addauction.jsp">Post Auction</a></li> 
            <li style="float:right"><a  href="LogoutServlet"  >Logout</a></li>
            <li><a href="updateTimeServlet">My Auctions</a></li> 
            <li><a href="ratingUserList.jsp">User Ratings</a></li> 
        </ul>
        <h1><p style="color:#000080"><marquee behavior="alternate" direction="right" >Welcome to EngineSell,  <%
            out.println(session.getAttribute("name"));
                %>!!!</marquee></p></h1> 

    <br><br><br><br>

    <div class="w3-content w3-section" style="max-width:1400px">
        <img class="mySlides" src="images/car.jpg" style="width:100%">
        <img class="mySlides" src="images/jewer.jpg" style="width:100%">
        <img class="mySlides" src="images/coin.jpg" style="width:100%">
        <img class="mySlides" src="images/vase.jpg" style="width:100%">
        <img class="mySlides" src="images/mona.jpg" style="width:100%">
    </div>
    <script>
        var myIndex = 0;
        carousel();

        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
                x[i].style.display = "none";
            }
            myIndex++;
            if (myIndex > x.length) {
                myIndex = 1
            }
            x[myIndex - 1].style.display = "block";
            setTimeout(carousel, 2000); // Change image every 2 seconds
        }
    </script>
</body>  
</html>




