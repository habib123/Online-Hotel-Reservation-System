<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%  

if(null == session.getAttribute("username")){  
  response.sendRedirect("customerLogin.jsp");  
}else{  
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Customer Status</title>
    <link rel="stylesheet" href="css/status.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <h1>Wellcome to Hotel Star </h1>
      </div>
      <div id="company">
        <h2 class="name">Hotel Star</h2>
        <div>Christoph-probst Stra.8,80805,Munich</div>
        <div>+49-15224685887</div>
        <div>hotelstar@tum.com</div>
      </div>
      </div>
    </header>
    <main>
      <div id="details" class="clearfix">
        <div id="client">
          <div class="to">TO:</div>
          <h2 class="name">Name: ${customerBean.firstname}&nbsp;&nbsp;&nbsp; ${customerBean.lastname}</h2>
          <div class="email">Email:${customerBean.e_mail}</div>
        </div>
        <div id="invoice">
          <h1>Your Bookig Status</h1>
          <div class="date" style="display:hide"></div>
        </div>
      </div>
	  <div id="details" class="clearfix"><h2><a href="index.jsp">Home&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a><a href="roomBooking.jsp">Room Booking</a><a href="signOutServlet">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Sign Out</a></h2></div>
      <table border="0" cellspacing="0" cellpadding="0">
        <thead>
          <tr>
            <th class="no">ID</th>
            <th class="desc">Hotel Name</th>
            <th class="unit">Room Type</th>
            <th class="qty">Entry Date</th>
            <th class="unit">Stay</th>
			<th class="qty">Price Per Day</th>
            <th class="unit">Total Cost</th>
            <th class="no2">Approval</th>
          </tr>        
        </thead>
        <tbody>
        <c:forEach var="bookBean" items="${bookBeanList}" >
          <tr>
            <td class="no">${bookBean.id}</td>
            <td class="desc"><h3>${bookBean.hotel_name}</h3></td>
            <td class="unit">${bookBean.room_type}</td>
            <td class="qty">${bookBean.entry_time}</td>
            <td class="unit">${bookBean.days}</td>
			<td class="qty">${bookBean.price_perday}</td>
            <td class="unit">${bookBean.totalcost}</td>
            <td class="no2">${bookBean.status}</td>
          </tr>
          </c:forEach> 
        </tbody>
      </table>
      <div id="thanks">Thank you!</div>
    </main>
 
  </body>
</html>
<%
}
%>