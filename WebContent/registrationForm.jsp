<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		// validate the comment form when it is submitted
		//$("#commentForm").validate();

		// validate signup form on keyup and submit
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

		// propose username by combining first- and lastname
		$("#username").focus(function() {
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			if (firstname && lastname && !this.value) {
				this.value = firstname + "." + lastname;
			}
		});

		//code to hide topic selection, disable for demo
		var newsletter = $("#newsletter");
		// newsletter topics are optional, hide at first
		var inital = newsletter.is(":checked");
		var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
		var topicInputs = topics.find("input").attr("disabled", !inital);
		// show when newsletter is checked
		newsletter.click(function() {
			topics[this.checked ? "removeClass" : "addClass"]("gray");
			topicInputs.attr("disabled", !this.checked);
		});
	});
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
                <li><a href="">Sign in</a></li>
                <li><a href="">Sign out</a></li>
                <li><a href="" class="last">Contact</a></li>
            </ul> 
        </div>    
    </div> <!-- end of banner -->
    
    <div id="templatemo_content">
    
    	<div id="content_left">
        	<div class="content_left_section">
            	<div class="content_title_01">Booking</div>
                    <form method="get" action="#">
                    
                      <div class="form_row">
                            <label>Arrival</label>
                            <select name="day">
                                <option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option>
                            </select>
                        <select name="month">
                                <option>Jan</option><option>Feb</option><option>Mar</option><option>April</option><option>May</option><option>June</option><option>July</option><option>Aug</option><option>Sep</option><option>Oct</option><option>Nov</option><option>Dec</option>
                        </select>
                        <select name="year">
                                <option>2010</option><option>2011</option><option>2012</option><option>2013</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option><option>2022</option><option>2023</option><option>2024</option>
                        </select>
                      </div>
                      <div class="form_row">
                            <label>Departure</label>
                            <select name="day">
                                <option>1</option><option>2</option><option>3</option><option>4</option><option>5</option><option>6</option><option>7</option><option>8</option><option>9</option><option>10</option><option>11</option><option>12</option><option>13</option><option>14</option><option>15</option><option>16</option><option>17</option><option>18</option><option>19</option><option>20</option><option>21</option><option>22</option><option>23</option><option>24</option><option>25</option><option>26</option><option>27</option><option>28</option><option>29</option><option>30</option><option>31</option>
                            </select>
                        <select name="month">
                                <option>Jan</option><option>Feb</option><option>Mar</option><option>April</option><option>May</option><option>June</option><option>July</option><option>Aug</option><option>Sep</option><option>Oct</option><option>Nov</option><option>Dec</option>
                        </select>
                        <select name="year">
                                <option>2010</option><option>2011</option><option>2012</option><option>2013</option><option>2014</option><option>2015</option><option>2016</option><option>2017</option><option>2018</option><option>2019</option><option>2020</option><option>2021</option><option>2022</option><option>2023</option><option>2024</option>
                        </select>
                      </div>
                        
                        <div class="form_row">
                            <label>Persons:</label>
                            <input class="inputfield" name="person" type="text" style="width: 30px; margin-right: 20px;" />
                        	
                            <label>Rooms:</label>
                            <input class="inputfield" name="person" type="text" style="width: 30px;" />
                        </div>
                        <div class="cleaner_h20">&nbsp;</div>
                        <div class="rc_btn_01"><a href="#">Check Availability</a></div>                        
                    </form>
                <div class="cleaner">&nbsp;</div>
            </div> <!-- end of booking -->
            
            <div class="cleaner_h30">&nbsp;</div>
            <div class="cleaner_horizontal_divider_01">&nbsp;</div>
            <div class="cleaner_h30">&nbsp;</div>
             
            <div class="content_left_section">
            <div class="content_title_01">Latest News</div>
                
                <div class="news_title">Nam auctor aliquam leo</div>
                    <p>Pellentesque est elit, sagittis sit amet porttitor ut, ornare vel turpis. Vivamus eu enimvitae neque its posuere rutrum. <a href="#">read more</a></p>
                <div class="cleaner_h30">&nbsp;</div>

                <div class="news_title">Suspendisse pharetra eros molestie</div>
                    <p>Vivamus eu enimvitae neque its posuere rutrum. Nam accumsan turpis at turpis molestie a convallis forte tor ornare. <a href="#">read more</a></p>
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
					
					<form class="cmxform" id="signupForm" method="post" action="registration">
						<fieldset>
							<p>Complete the form with your information</p><hr size="2" width="50%" noshade style="color:#000000" align="left" />
							<p id="hname">
								<label for="hotelname">Hotelname</label>
								<input id="hotelname" name="hotelname" type="text" value = "Hotel Star" disabled>
							</p>
							<p>
								<label for="firstname">Firstname</label>
								<input id="firstname" name="firstname" type="text" style= "float:centre;" class="center" value="${firstname}">
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
            	<div class="content_title_01">Tour Guides</div>
                <p>Curabitur tempor mattis placerat. Duis malesuada posuere magna at fermentum.</p>
                <ul>
                	<li>Quisque facilisis suscipit elit</li>
                    <li>Lacus et dictum tristique</li>
                    <li>Eeros ac tincidunt aliquam</li>
                    <li>Nullam commodo arcu non facilisis</li>
                    <li>Duis commodo erat</li>
                </ul> 
                <div class="cleaner_h10">&nbsp;</div>
                <div class="rc_btn_02"><a href="#">View All</a></div>          
            </div>

            <div class="content_right_2column_box">
            	<div class="content_title_01">Services</div>     
                <p>Donec eget ligula metus. In sapien nibh, tincidunt non ultricies vel, molestie quis massa. </p>           
                <ul>
                	<li>Cras metus lectus</li>
                    <li>Mauris vitae lacinia tortor</li>
                    <li>Suspendisse potenti</li>
                    <li>Pellentesque tincidunt magna</li>
                </ul>
                <div class="cleaner_h10">&nbsp;</div>
                <div class="rc_btn_02"><a href="#">View All</a></div>          
            </div>    
            
            <div class="cleaner_h40">&nbsp;</div>
            
            
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
    Copyright © 2048 <a href="#"><strong>Tehcnical University of Munich</strong></a> | <a href="http://www.iwebsitetemplate.com" target="_parent">Seminar Project</a> by <a href="http://www.templatemo.com" target="_parent">Md.Habibur Rahman</a>
        <div style="clear: both; margin-top: 10px;">                
            <a href="http://validator.w3.org/check?uri=referer"></a>
            <a href="http://jigsaw.w3.org/css-validator/check/referer"></a>        </div> 
	</div> <!-- end of footer -->
</div> <!-- end of container -->
<!-- Free Website Templates @ TemplateMo.com -->
</body>
</html>