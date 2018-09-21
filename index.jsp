<%-- 
    Document   : index.jsp
    Created on : Sep 21, 2018, 2:34:46 PM
    Author     : dataman
--%>



<%@page import="java.util.List"%>
<%@page import="dao.CityDaoImpl"%>
<%@page import="model.City"%>
<%@page import="dao.EntityDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%!
    EntityDao<City> cityDao;
    List<City> clist;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .disabled{
                pointer-events: none;
                cursor: default;
            }
            .disLink{
                text-decoration: none;
            }
        </style>

        <script>
            function onDateSubmit(obj) {
                var dobstr = obj.value;
                if (dobstr !== null) {
                    var dob = new Date(dobstr);
                    var age = (Date.now() - dob) / 31557600000;
                    document.getElementById("age").value = Math.round(age);
                }
            }

            function onCitySelect(obj) {
                var city = obj.options[obj.selectedIndex].value;
                document.getElementById("state").value = city;
                document.getElementById("country").value = city;
                console.log(city);
            }

            function addRow() {
                var table = document.getElementById("mytable");
                var row = table.insertRow(2);
                var cell1 = row.insertCell(0);
                var cell2 = row.insertCell(1);
                var cell3 = row.insertCell(2);
                var cell4 = row.insertCell(3);
                var cell5 = row.insertCell(4);

                cell1.innerHTML = "<input type='text' name='class' size='10' />";
                cell2.innerHTML = "<input type='text' name='class' size='10' />";
                cell3.innerHTML = "<input type='text' name='class' size='10' />";
                cell4.innerHTML = "<input type='text' name='class' size='10' />";
                cell5.innerHTML = "<input type='text' name='class' size='10' id ='per'/>";
                addPercent();
            }
            
            function addPercent(){
                var sum = document.getElementById("total").value;
                var percent = document.getElementById("per").value;
                sum = sum + percent;
                document.getElementById("total").value = undefined;
                document.getElementById("total").value = sum;
            }

        </script>
    </head>
    <body>
        <% cityDao = new CityDaoImpl(); %>

        <form action="savedata" method="POST">
            <center>
                <table border="1" cellpadding="3" cellspacing="1">

                    <tbody>
                        <tr>
                            <td><input type="submit" value="Save" 
                                       style="background-color:transparent"/></td>
                            <td><a href="#" class="disLink">Edit</a></td>
                            <td><a href="#" class="disLink disabled">Delete</a></td>
                            <td><a href="#" class="disLink disabled">Find</a></td>
                            <td><a href="#" class="disLink disabled">Save</a></td>
                        </tr>
                    </tbody>
                </table>
            </center>
            <hr/>

            <center>
                <label style="color: red">* Fields are mandatory</label>
                <table cellspacing="5" cellpadding="5">
                    <tbody>
                        <tr>
                            <td>Name* : </td>
                            <td><input type="text" name="name" value="" size="20" required/></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>DOB* : </td>
                            <td><input type="text" name="dob" value="dd/MM/yyyy" id ="dob" onchange="onDateSubmit(this)" required/></td>
                            <td>Age : </td>
                            <td><input type="text" name="age" value="" size="10" id="age"/></td>
                        </tr>
                        <tr>
                            <td>Date of Joining : </td>
                            <td><input type="text" name="doj" value="" size="20" /></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Address : </td>
                            <td><textarea name="address" rows="4" cols="20">
                                </textarea></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>City : </td>
                            <td><select name="city_id" onchange="onCitySelect(this)" >
                                    <% clist = cityDao.getUsers();
                                        if (clist != null) {
                                            for (City c : clist) {
                                    %>
                                    <option><%= c.getName()%></option>
                                    <%
                                            }
                                        }
                                    %>


                                </select></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>State : </td>
                            <td><input type="text" name="state" value="" size="20" id="state" readonly></td>
                            <td>Country : </td>
                            <td><input type="text" name="country" value="" size="20" id="country" readonly></td>
                        </tr>
                    </tbody>
                </table>

            </center>
        </form>
    <center>

        <table cellpadding="10" cellspacing="1" id="mytable">
            <thead>
                <tr>
                    <th>Class</th>
                    <th>Board</th>
                    <th>Obtain</th>
                    <th>Full Marks</th>
                    <th>%</th>
                </tr>
            </thead>

            <tbody >
                <tr>
                    <td><input type="text" name="class" value="" size="10" /></td>
                    <td><input type="text" name="board" value="" size="10" /></td>
                    <td><input type="text" name="obtain" value="" size="10" /></td>
                    <td><input type="text" name="fmarks" value="" size="10" /></td>
                    <td><input type="text" name="percent" value="" size="10"  id="per"/></td>
                </tr>

                <tr>    
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><b>Total</b></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="text" name="class" value="" size="10" id="total"/></td>
                    <td><button onclick="addRow()">Add Row</button></td>
                </tr>

            </tbody>
        </table>


    </center>






</body>
</html>
