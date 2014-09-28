 <%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
//String url=request.getParameter("url");
//String comment=request.getParameter("comment");
%>
<h3><font color=red>YOUR ROOM HAS BEEN BOOKED SUCCESSFULLY!!</font></h3>
<b><font color=blue>
<%
out.println("NAME : "+name);
%><br>Hellow<%
out.println("EMAIL :  "+email);
%><br><%
//out.println("URL : "+ url);
%><br><%
//out.println("COMMENT : "+comment);
%>
</font>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Invoice for Hotel Star</title>
    <link rel="stylesheet" href="css/invoice.css" media="all" />
  </head>
  <body>
    <header class="clearfix">
      <div id="logo">
        <h1>HOTEL STAR</h1>
      </div>
      <h2>INVOICE : ID</h2>
      <div id="company" class="clearfix">
        <div>Hotel Star</div>
        <div>Christoph-probst Str. 8<br /> 80805 , Munich</div>
        <div>(602) 519-0450</div>
        <div>company@star.com</a></div>
      </div>
      <div id="project">
        <div><span>STATUS</span>Room Booking Sytem </div>
        <div><span>CUSTOMER</span> John Doe</div>
        <div><span>ADDRESS</span> 796 Silver Harbour, TX 79273, US</div>
        <div><span>EMAIL</span> <a href="mailto:john@example.com">john@example.com</a></div>
        <div><span>DATE</span> August 17, 2015</div>
      </div>
    </header>
    <main>
      <table>
        <thead>
          <tr>
            <th class="service"><h3>Last name</h3></th>
            <th class="desc"></th>
           
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="service">First Name</td>
            <td class="desc">Creating a recognizable design solution based on the company's existing visual identity</td>
            
          </tr>
          <tr>
            <td class="service">Development</td>
            <td class="desc">Developing a Content Management System-based Website</td>
            
          </tr>
          <tr>
            <td class="service">SEO</td>
            <td class="desc">Optimize the site for search engines (SEO)</td>
            
          </tr>
          <tr>
            <td class="service">Training</td>
            <td class="desc">Initial training sessions for staff responsible for uploading web content</td>
            
          </tr>
           <tr>
            <td class="service">Training</td>
            <td class="desc">Initial training sessions for staff responsible for uploading web content</td>
          </tr>
          <tr>
            <td class="service">Training</td>
            <td class="desc">Initial training sessions for staff responsible for uploading web content</td>
          </tr>
          <tr>
            <td class="grand total">TOTAL COST</td>
            <td class="grand total">$6,500.00</td>
          </tr>
        </tbody>
      </table>
    
    </main>
    <footer>
      Invoice was created on a computer and is valid without the signature and seal.
    </footer>
  </body>
</html>