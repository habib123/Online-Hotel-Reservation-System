<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Invoice for Room Booking</title>
    <link rel="stylesheet" href="css/invoice.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
    <h3><font color=green>YOUR ROOM HAS BEEN BOOKED SUCCESSFULLY!!</font></h3>
      <div id="logo">
        <h1>HOTEL STAR</h1>
      </div>
      <h2>INVOICE : ${bookBean.id}</h2>
      <div id="company" class="clearfix">
        <div>Hotel Star</div>
        <div>Christoph-probst Str. 8<br /> 80805 , Munich</div>
        <div>+49-15224685887</div>
        <div>company@star.com</a></div>
      </div>
      <div id="project">
        <div><span>STATUS</span>Room Booking System </div>
        <div><span>CUSTOMER</span>${customerBean.firstname}&nbsp;&nbsp;&nbsp;${customerBean.lastname}</div>
        <div><span>ADDRESS</span> ${bookBean.address}</div>
        <div><span>EMAIL</span>${customerBean.e_mail}</div>
        <div><span>DATE</span> ${bookBean.booked_time}</div>
      </div>
    </header>
    <main>
    <div><a href="insex.jsp" >Home</a><a href="signOutServlet" >sign out</a></div>
      <table>
        <thead>
          <tr>
            <th class="service"><h3>${customerBean.lastname}</h3></th>
            <th class="desc"></th>
           
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="service">Room Type</td>
            <td class="desc">${bookBean.room_type}</td>
          </tr>
          <tr>
            <td class="service">Entry Date</td>
            <td class="desc">${bookBean.entry_time}</td>
          </tr>
          <tr>
            <td class="service">Days to stay</td>
            <td class="desc">${bookBean.days}</td>  
          </tr>
          <tr>
            <td class="service">Price Per Day</td>
            <td class="desc">${bookBean.price_perday}$</td>  
          </tr>
		  <c:choose>
		    <c:when test="${empty bookBean.paymentmethod}">
		       <tr>
	            <td class="service">Payment Method</td>
	            <td class="desc">-</td>
	          </tr>
		    </c:when>
		    <c:otherwise>
		       <tr>
	            <td class="service">Payment Method</td>
	            <td class="desc">${bookBean.paymentmethod}</td>
	          </tr>
		    </c:otherwise>
		  </c:choose>
          <tr>
            <td class="service">Phone</td>
            <td class="desc">${bookBean.phone}</td>
          </tr>
          <tr>
            <td class="service">Comment</td>
            <td class="desc">${bookBean.comment}</td>
          </tr>
         <tr>
            <td class="grand total">TOTAL PAYABLE COST</td>
            <td class="grand total">${bookBean.totalcost}$</td>
          </tr>
        </tbody>
      </table>
    
    </main>

  </body>
</html>