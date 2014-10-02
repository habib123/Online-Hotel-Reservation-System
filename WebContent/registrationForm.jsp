<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Hotel Reservation System</title>

<link rel="stylesheet" href="css/screen.css">
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	
	<script src="lib/jquery.js"></script>
	<script src="dist/jquery.validate.js"></script>
	<script>
 //$.noConflict();
	 $(document).ready(function() {

		$("#signupForm").validate({
			rules: {
				firstname: "required",
				lastname: "required",
				address: "required",
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
				topic: {
					required: "#newsletter:checked",
					minlength: 2
				},
				agree: "required"
			}, 
			messages: {
				firstname: "Please enter your firstname",
				lastname: "Please enter your lastname",
				address: "Please enter your address",
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


		var form = $('#signupForm1');
form.submit(function () {
 
$.ajax({
type: form.attr('method'),
url: form.attr('action'),
data: form.serialize(),
success: function (data) {
var result=data;

			if(data=="exist"){
			$('#result').attr("value","Dublicate Username");
			return false;
			}
			
},

error: function( errorThrown ){ $('#result').attr("value","Dublicate Username"); }



});
 
return false;
});


		// propose username by combining first- and lastname
		$("#username").focus(function() {
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			if (firstname && lastname && !this.value) {
				this.value = firstname + "." + lastname;
			}
		});
		
	}); // function
	
/*	 $.noConflict();

	
	
	*/
	
	
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
	#result{
	}

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
					<p id="headlin">Welcome for  Room Booking Registration Form</p>
					
					 <c:if test="${not empty username1}">
							  <p id="result">"${username1}"<p>
					 </c:if>
					
					<form class="cmxform" id="signupForm" method="post" action="registration">
						<fieldset>
							<p>Complete the form with your information</p><hr size="2" width="50%" noshade style="color:#000000" align="left" />
							    
							
							<p id="hname">
								<label for="hotelname">Hotelname</label>
								<input id="hotelname" name="hotelname" type="text" value = "Hotel Star" disabled>
							</p>
							
							<p>
								<label for="firstname">Firstname</label>
								<input id="firstname" name="firstname" type="text" style= "float:centre;" class="center" >
							</p>
							<p>
								<label for="lastname">Lastname</label>
								<input id="lastname" name="lastname" type="text" class="center" >
							</p>
							<p>
								<label for="username">Username</label>
								<input id="username" name="username" type="text" class="center">
							</p>
							<p>
								<label for="password">Password</label>
								<input id="password" name="password" type="password" class="center">
							</p>
							<p>
								<label for="confirm_password">Confirm password</label>
								<input id="confirm_password" name="confirm_password" type="password" class="center">
							</p>
							<p>
								<label for="email">Email</label>
								<input id="email" name="email" type="email" class="center">
							</p>
							<p>
								<input class="submit" type="submit" value="Submit">
							</p>
						</fieldset>
					</form>
					
					
					

					
					
					
					
					
					
					
				</div>
				
       	  </div>
            
            
			<div class="cleaner_h40">&nbsp;</div>
            
            <div class="content_right_2column_box">
            	
        
            </div>

   
            
            
            <div class="content_right_section">
                <div class="content_title_01">Gallery</div>
                    <div class="gallery_box">
                    	<img src="images/templatemo_image_02.jpg" alt="image" />
                        <a href="#">one</a>
                    </div>
                    <div class="gallery_box">
	                    <img src="images/templatemo_image_03.jpg" alt="image" />
                        <a href="#">two</a>
                    </div>
                    <div class="gallery_box">
	                    <img src="images/templatemo_image_04.jpg" alt="image" />
                        <a href="#">three</a>
                    </div>
                    <div class="gallery_box">
                    	<img src="images/templatemo_image_05.jpg" alt="image" />
                        <a href="#">four</a>
                    </div>
                    <div class="gallery_box">
                    	<img src="images/templatemo_image_06.jpg" alt="image" />
                        <a href="#">five</a>
                    </div>
                    
                    <div class="cleaner_h20">&nbsp;</div>
                    <div class="rc_btn_02"><a href="#">View All</a></div>
                    
                    <div class="cleaner">&nbsp;</div>
			</div>                    
        	<div class="cleaner_h20">&nbsp;</div>
        </div> <!-- end of content right -->
        
        <div class="cleaner">&nbsp;</div>
    </div>
    
    <div id="templatemo_footer">
    Copyright © 2048 <a href="#"><strong>Tehcnical University of Munich</strong></a> | Seminar Project by <a href="#">Md.Habibur Rahman</a>
        <div style="clear: both; margin-top: 10px;">                
                   </div> 
	</div> <!-- end of footer -->
</div> <!-- end of container -->
<!-- Free Website Templates @ TemplateMo.com -->
</body>
</html>