<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%  

if(null == session.getAttribute("username")){  
  response.sendRedirect("customerLogin.jsp");  
}else{  

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html5/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hotel Reservation System</title>

<link rel="stylesheet" href="css/screen.css">
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

	
	<script src="lib/jquery.js"></script>
	<script src="dist/jquery.validate.js"></script>
	
	<script>
 
	$().ready(function() {

		$("#signupForm").validate({
			rules: {
				address: "required",
				phone: "required",
				comment: "required",
				username: {
					required: true,
					minlength: 2
				},
				password: {
					required: true,
					minlength: 5
				},
				confirm_password: {
					required: true,
					minlength: 5,
					equalTo: "#password"
				},
				email: {
					required: true,
					email: true
				},

				agree: "required"
			}, 
			messages: {
				address: "Please enter your address",
				phone: "Please enter your phone",
				comment: "Please enter your comment",
				username: {
					required: "Please enter a username",
					minlength: "Your username must consist of at least 2 characters"
				},
				password: {
					required: "Please provide a password",
					minlength: "Your password must be at least 5 characters long"
				},
				confirm_password: {
					required: "Please provide a password",
					minlength: "Your password must be 5 characters long",
					equalTo: "Please enter the same password as above"
				},
				email: "Please enter a valid email address",
				agree: "Please accept our policy"
			}
		});


		//code to hide payMethod selection, disable for demo
		var payMethod = $("#paymentOption");
		// payMethod topics are optional, hide at first
		var inital = payMethod.is(":checked");
		var method = $("#paymentOption_topics")[inital ? "removeClass" : "addClass"]("gray");
		var methodInputs = method.find("input").attr("disabled", !inital);
		// show when payMethod is checked
		payMethod.click(function() {
			method[this.checked ? "removeClass" : "addClass"]("gray");
			methodInputs.attr("disabled", !this.checked);
		});
	});

       document.getElementById("p1").innerHTML = "Total cost= 30";
	      function OnSelectionChange () {
                       
            var r = document.getElementById("roomType");
			var room = r.options[r.selectedIndex].value;
			
			var d = document.getElementById("day");
			var day = d.options[d.selectedIndex].value
			
		if(room == "Single"){
              var totalcost = day*50;
              document.getElementById("p1").innerHTML = "Total cost= "+totalcost+"$";
			  document.getElementsByName("total")[0].setAttribute("value", totalcost);
 
			}
		else if(room == "Double"){
			  var totalcost = day*80;
              document.getElementById("p1").innerHTML = "Total cost= "+totalcost+"$"; 
			  document.getElementsByName("total")[0].setAttribute("value", totalcost);
			}
			
			else{
              var totalcost = day*100;
              document.getElementById("p1").innerHTML = "Total cost= "+totalcost+"$"; 
			  document.getElementsByName("total")[0].setAttribute("value", totalcost);
			}	
         
        } //function
        
        
function onClickCheck(){

	var rightNow = new Date();
  	var d1 = document.getElementById("calendar").value;
	var date= new Date(d1);

	if(rightNow <= date){
	document.getElementById("dat").innerHTML = "";
	}
	else{
	 document.getElementById("dat").innerHTML = "Can not be past date ";
	  return false;  //alert("Hello! I am an alert dsasdasdsa!");
	  }
			
}
	
	</script>
	
	<style>
	
	#signupForm {
		width: auto;
	}
	#signupForm label {
		width: auto;
	}
	#signupForm label.error, #commentForm input.submit {
		margin-left: auto;
	}
	#main{
	background-color: #b0c4de !important;
	}
	p#headlin{
	 font-size: 200%;
	  color: green;
	}
	p#dat{color: red;}
	
	
	#templatemo_menu{
padding-left: 100px;
}
	
	
	</style>



</head>
<body>
<div id="templatemo_container">
	<!-- Free Website Template by www.TemplateMo.com -->
    <div id="templatemo_header">
        <div id="website_title">
            <div id="title">
	            Hotel Star
            </div>
            <div id="salgon">
	            The best service at the lowest price</div>
        </div>
    </div> <!-- end of header -->
    
    <div id="templatemo_banner">
    	<div id="templatemo_menu">
          
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="registrationForm.jsp"class="current">Bookings</a></li>
                <li><a href="customerLogin.jsp">Sign in</a></li>
                <li><a href="" class="last">Contact</a></li>
            </ul>
           
        </div>    
    </div> <!-- end of banner -->
    
    <div id="templatemo_content">
    
    	<div id="content_left">
        	<div class="content_left_section">
            	<div class="content_title_01">Booking</div>
                         You can reserve hotel room by using this web site and see the room categories to select your room.
                    This web is useful for reserving the room at least seven days ago even three months ago. If you are 
                    interested to reserver your room now,then no more late to registration for the initiative. 
                <div class="cleaner">&nbsp;</div>
            </div> <!-- end of booking -->
            
            <div class="cleaner_h30">&nbsp;</div>
            <div class="cleaner_horizontal_divider_01">&nbsp;</div>
            <div class="cleaner_h30">&nbsp;</div>
             
            <div class="content_left_section">
            <div class="content_title_01">Latest News</div>
                
  				<div class="news_title">Executive room is cheap now</div>
                    <p>Most of the customer are in need of executive rooms.So considering the situation hotel star authorities decided to offer a cheap price in this coming winter.<a href="#">read more</a></p>
                <div class="cleaner_h30">&nbsp;</div>

                <div class="news_title">Discount for the student</div>
                    <p>Hotel Star is now offering a lucrative price from winter.If student reserve room before seven days ago then they will get a good amount of discount.</br><a href="#">read more</a></p>
                  <div class="cleaner_h20">&nbsp;</div>
                    <div class="rc_btn_02"><a href="#">View All</a></div>         
          </div>   <!-- end of news section -->
                <div class="cleaner_h30">&nbsp;</div>

            <div class="cleaner_horizontal_divider_01">&nbsp;</div>
            <div class="cleaner_h30">&nbsp;</div>
            
            <a href="" target="_parent"></a>
          <div class="cleaner_h30">&nbsp;</div>
        </div> <!-- end of content left -->
        
        <div id="content_right">
        
        	<div class="content_right_section">
        	
				<div id="main">
					<p id="headlin">Welcome for  Room Booking Form</p>
					
					<form class="cmxform" id="signupForm" method="post" action="bookingForm">
						<fieldset>
							<p>Complete the form with required information</p><hr size="2" width="50%" noshade style="color:#000000" align="left" />
							<p id="hname">
								<label for="hotelname">Well Come to Hotel star</label>
								<input id="hotelname" name="hotelname" type="hidden" value = "Hotel Star" >
							</p>
							
							<p>
								<label for="address">Address(required)</label>
								<input id="address" name="address" type="text" class="center" >
							</p>
							<p>
								<label for="phone">Phone(required)</label>
								<input id="phone" name="phone" type="text" class="center">
							</p>
							<p>Entry Date:<input name="cal" class="timeselect" type="date" onchange="onClickCheck()" id="calendar"required></p>
							<p id="dat" class="error"></p>
							<p>
								<label for="agree">Please agree to our policy</label>
								<input type="checkbox" class="checkbox" id="agree" name="agree">
							</p>
							 <p>
							 <label for="bookdate">Select you booking date</label>
							 </p>
							<p>
							<label for="roomtype">Select room type</label>
							<select name = "roomtype" id="roomType" onchange="OnSelectionChange()">
							  <option value="Single">Single</option>
							  <option value="Double">Double</option>
							  <option value="Executive">Executive</option>
							</select>
							
							<label for="days">Select days to stay </label>
							<select name = "days" onchange="OnSelectionChange()" id="day">
							  <option value="1">1</option>
							  <option value="2">2</option>
							  <option value="3">3</option>
							  <option value="4">4</option>
							  <option value="5">5</option>
							  <option value="6">6</option>
							  <option value="7">7</option>
							</select>
							<total id="p1" name="totalcost" value="50">Total Cost 50$</total>
							<input id="p2" name="total" type = "hidden"  value="50">
							</p>
							<p>
								<label for="paymentOption">I'd like to define my payment method</label>
								<input type="checkbox" class="checkbox" id="paymentOption" name="paymentOption">
							</p>
							<fieldset id="paymentOption_topics">
								<legend>Select Your Payment Method</legend>
								<label for="topic_marketflash">
									<input type="checkbox" id="topic_creditcard" value="Credit Card" name="payMethod">Credit card
								</label>
								<label for="topic_fuzz">
									<input type="checkbox" id="topic_debitcard" value="Debit Card" name="payMethod">Debit Card
								</label>
								<label for="topic_digester">
									<input type="checkbox" id="topic_cash" value="Cash" name="payMethod">Cash
								</label>
								
							</fieldset>
							<p>
								<label for="ccomment">Your comment (required)</label>
								<textarea id="ccomment" name="comment" ></textarea>
							 </p>
							
							<p>
								<input class="submit" type="submit" value="Submit">
							</p>
						</fieldset>
					</form>
				</div>
				
       	  </div>
			<div class="cleaner_h40">&nbsp;</div>
        </div> <!-- end of content right -->
        
        <div class="cleaner">&nbsp;</div>
    </div>
    
    <div id="templatemo_footer">
    Copyright � 2048 <a href="#"><strong>Tehcnical University of Munich</strong></a> | <a href="http://www.iwebsitetemplate.com" target="_parent">Seminar Project</a> by <a href="http://www.templatemo.com" target="_parent">Md.Habibur Rahman</a>
        <div style="clear: both; margin-top: 10px;">                
            <a href="http://validator.w3.org/check?uri=referer"></a>
            <a href="http://jigsaw.w3.org/css-validator/check/referer"></a>        </div> 
	</div> <!-- end of footer -->
</div> <!-- end of container -->
<!-- Free Website Templates @ TemplateMo.com -->
</body>
</html>
<%
}
 %>
