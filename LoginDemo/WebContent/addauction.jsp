
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import= "AuktionDAO.CategorySerializierung" %>
<%@ page import= "java.util.*" %>
<%@ page import= "beans.Category" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>jQuery UI Datepicker</title>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <style
            type="text/css">
            body {background-color: #99FF66;background-image: url(http://www.topglobus.ru/fotoalbum/pozadi/galerie/520.jpg);}</style>
        <style>
            form {
                border: 3px solid #000080;
            }

            select {
                border: 0 none;
                color: white;
                background: black;
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


            input[type=text], input[type=password]{
                width: 60%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }
            h1 {
                color: green;  text-align: center;
            }
            button {
                background-color: #4CAF50;
                color: white;
                padding: 10px 18px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 30%;

            }

            .button {
                background-color: #87CEFA; /* Green */
                border: none;
                color: white;
                padding: 16px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .button1 {
                background-color: white; 
                color: black; 
                border: 2px solid #000080;
            }

            .button1:hover {
                background-color: #87CEFA;
                color: white;
            }

            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;

            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {


            }
        </style>
    <body>
        <h1 align="center" style="color:Black"><font face="Comic sans MS" size="5">Create Your Auction Here</font></h1>
        <form method="post"  action="AuctionServlet"> 
            <div class="container">
                <label><b> Name</b></label><br>

                <input type="text" placeholder="Enter name" name="name" required><br>

                <label><b>Starting Price</b></label><br>

                <input type="text" placeholder="Enter starting price" name="price" required><br>

                <label><b>Description</b></label><br>

                <input type="text" placeholder="Enter description" name="desc" required><br>

                <form method="post" action="SearchByCategory">
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

                    <br>

                    <input type="hidden" id="user" name="user" value="<%
                        out.println(session.getAttribute("name"));
                           %>">

                    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
                    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
                    <script>
                        $(function () {
                            $("#datepicker").datepicker({
                                onSelect: function (dateText, inst) {
                                    //Get today's date at midnight
                                    var today = new Date();
                                    today = Date.parse(today.getMonth() + 1 + '/' + today.getDate() + '/' + today.getFullYear());
                                    //Get the selected date (also at midnight)
                                    var selDate = Date.parse(dateText);

                                    if (selDate <= today) {
                                        //If the selected date was before today, continue to show the datepicker
                                        $('#datepicker').val('');
                                        $(inst).datepicker('show');
                                    }
                                }
                            });
                        });
                    </script>

                    <br> 

                    <label><b>Date</b></label><br>

                    <input type="text" placeholder="Enter date of expiration" id="datepicker" name="datepicker" required><br>



                    <input type="submit"  class="button button1" value="Post!" />

            </div>
            <div class="container" style="background-color:#f1f1f1">
                <a href="userMenu.jsp">
                    <p align="right"> 
                        <button type="button" class="cancelbtn">Cancel</button></a>
                </p>
            </div>
        </form>
    </body>
</html>







