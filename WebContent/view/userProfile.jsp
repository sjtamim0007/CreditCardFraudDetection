<!DOCTYPE html>
<html>
<head>
	<title>User Info</title>
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<style><%@ include file="css/user.css"%></style>
	<style><%@ include file="css/dropdownsub.css"%></style>
	<style><%@ include file="css/userProfile.css"%></style>
	<style><%@ include file="css/styleuser.css"%></style>
	<style><%@ include file="css/footer.css"%></style>
	
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
		     	</button>
				<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-leaf" aria-hidden="true"></span> Online Bank</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">
				<ul class ="nav navbar-nav">
					<li class=""><a href="#">Home</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>
					<li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My DashBoard <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            
		          	<!-- Accounts option-->
		            <li class="dropdown-submenu">
	                  <a  class="dropdown-item" tabindex="-1" href="#">Accounts</a>
	                  <ul class="dropdown-menu">
	                    <div class="btn-group-vertical">
							<form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
						    <input type="hidden" name="action" value="userInfo">
						    <button type="submit" class="btn btn-default button2">Account details</button>
							</form>
							<li role="separator" class="divider"></li>
						    <form action="${pageContext.request.contextPath}/TransactionHistoryController" method="post" class="form-inline" autocomplete="off">
						    <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
						    <input type="hidden" name="action" value="transactionHistory">
						    <button type="submit" class="btn btn-default button3">Transaction history</button>
						  </form>
						</div>
	                  </ul>
                	</li>
		            
		            <li role="separator" class="divider"></li>
		            <!-- Transfer option-->
		            <li class="dropdown-submenu">
	                  <a  class="dropdown-item" tabindex="-1" href="#">Transfers</a>
	                  <ul class="dropdown-menu">


	                    <div class="btn-group-vertical">
						  	<form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <button type="button" class="btn btn-default button1">Local Transfer</button>
							</form>
							<li role="separator" class="divider"></li>
						    <form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <button type="button" class="btn btn-default button3">Transfer history</button>
						  </form>
						</div>

	                  </ul>
                	</li>

                	<li role="separator" class="divider"></li>
		            <!-- Payments option-->
		            <li class="dropdown-submenu">
	                  <a  class="dropdown-item" tabindex="-1" href="#">Payments</a>
	                  <ul class="dropdown-menu">
	                    
						  <div class="btn-group-vertical">
						  	<form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <button type="button" class="btn btn-default button1">Pay Bills</button>
							</form>
							<li role="separator" class="divider"></li>
						    <form action="${pageContext.request.contextPath}/AccountDetailsController" method="post" class="form-inline" autocomplete="off">
						    <button type="button" class="btn btn-default button3">Payment History</button>
						  </form>
						  </div>
						
	                  </ul>
                	</li>

		          </ul>
		        </li>
				</ul>

				<ul class="nav navbar-nav navbar-right">
			        <li><a href="#"><%= request.getAttribute("userName") %> <i class="fa fa-user-plus" aria-hidden="true"></i></a></li>
			        <li><a href="view/logout.jsp">LogOut <i class="fa fa-user" aria-hidden="true"></i></a></li>
			    </ul>
		    </div>
			
		</div>
	</nav>
<br><br>
<section id="intro">
    <div class="intro-content">
      <h2>Welcome to our Bank!</h2>
      <h3>Celebrate this Boishakh with exclusive offers with your Standard Chartered card.</h3>
      <div>
        <a href="#section-services" class="btn-get-started scrollto">See Boishakh Offers</a>
      </div>
    </div>
  </section>
    
    <div class="container bootstrap snippet but" id="profile">
    
    <div class="row">
      <form action="${pageContext.request.contextPath}/ATMHomeController" method="post" class="form-inline" autocomplete="off">
                        <input type="hidden" name="userName" value="<%=request.getAttribute("userName") %>">
                        <div class="col-xs-6">
                            <button type="submit" class="btn10 btn-lg btn-success btn-rounded btn1">ATM</button>
                        </div>
                        </form>

    </div><br><br>

  <!-- services -->
  <section id="section-services" class="section pad-bot30 bg-white">
    <div class="container">
			<div class="tab-content text-center">
                        <h2>Our Offers</h2>
            </div>
      <div class="row mar-bot40">
        <div class="col-lg-4">
          <div class="hi-icon-wrap hi-icon-effect-5 hi-icon-effect-5a mar-top20">
            <div class="float-left mar-right20">
            </div>
          </div>
          <h3 class="text-bold">Mobile Bank Bangladesh</h3>
          <p>Download the mobile banking app and manage your funds effortlessly.</p>

          <div class="clear"></div>
        </div>

        <div class="col-lg-4">
          
          <h3 class="text-bold">The Good Life</h3>
          <p>Enjoy local & international deals on dining,hotels & shopping with your card.</p>

          <div class="clear"></div>
        </div>

        <div class="col-lg-4">
          
          <h3 class="text-bold">Beautiful</h3>
          <p>Like our facebook page and stay connected on fabulous deals, news and updates.</p>

          <div class="clear"></div>
        </div>

      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="hi-icon-wrap hi-icon-effect-5 hi-icon-effect-5a mar-top20">
            <div class="float-left mar-right20">
              <a href="#" class="hi-icon hi-icon-archive">See More</a>
            </div>
          </div>
          <h3 class="text-bold">Reward Programh</h3>
          <p>Earn Reward Points for every retail transaction using your credit card.</p>

          <div class="clear"></div>
          <div class="hi-icon-wrap hi-icon-effect-5 hi-icon-effect-5a mar-top20">
            <div class="float-left mar-right20">
              <a href="#" class="hi-icon hi-icon-clock">See More</a>
            </div>
          </div>
        </div>

        <div class="col-lg-4">
          <div class="hi-icon-wrap hi-icon-effect-5 hi-icon-effect-5a mar-top20">
            <div class="float-left mar-right20">
              <a href="#" class="hi-icon hi-icon-contract">See More</a>
            </div>
          </div>
          <h3 class="text-bold">Home Financing Solution</h3>
          <p>Buy your dream home with fast and flexible financing solutions at attractive ...</p>

          <div class="clear"></div>
          <div class="hi-icon-wrap hi-icon-effect-5 hi-icon-effect-5a mar-top20">
            <div class="float-left mar-right20">
              <a href="#" class="hi-icon hi-icon-clock">See More</a>
            </div>
          </div>
        </div>

        <div class="col-lg-4">
          <div class="hi-icon-wrap hi-icon-effect-5 hi-icon-effect-5a mar-top20">
            <div class="float-left mar-right20">
              <a href="#" class="hi-icon hi-icon-clock">See More</a>
            </div>
          </div>
          <h3 class="text-bold">Home Financing Solutions</h3>
          <p>Lorem ipsum dolor sit amet, elit persecuti efficiendi sit ad.</p>

          <div class="clear"></div>
          <div class="hi-icon-wrap hi-icon-effect-5 hi-icon-effect-5a mar-top20">
            <div class="float-left mar-right20">
              <a href="#" class="hi-icon hi-icon-clock">See More</a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <!-- spacer section:testimonial -->
  <section id="testimonials" class="section" data-stellar-background-ratio="0.5">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="align-center">
            <div class="flexslider testimonials-slider">
              
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>

  

  <!-- contact -->
  <section id="section-contact" class="section appear clearfix">
    <div class="container">

      <div class="row mar-bot40">
        <div class="col-md-offset-3 col-md-6">
          <div class="section-header">
            <h2 class="section-heading animated" data-animation="bounceInUp">Contact us</h2>
            <p>Any Query Needed?Send us mail</p>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-8 col-md-offset-2">
          <div class="cform" id="contact-form">
            <div id="sendmessage">Your message has been sent. Thank you!</div>
            <div id="errormessage"></div>
            <form action="" method="post" class="contactForm">

              <div class="field your-name form-group">
                <input type="text" name="name" placeholder="Your Name" class="cform-text" size="40" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
                <div class="validation"></div>
              </div>
              <div class="field your-email form-group">
                <input type="text" name="email" placeholder="Your Email" class="cform-text" size="40" data-rule="email" data-msg="Please enter a valid email">
                <div class="validation"></div>
              </div>
              <div class="field subject form-group">
                <input type="text" name="subject" placeholder="Subject" class="cform-text" size="40" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">
                <div class="validation"></div>
              </div>

              <div class="field message form-group">
                <textarea name="message" class="cform-textarea" cols="40" rows="10" data-rule="required" data-msg="Please write something for us"></textarea>
                <div class="validation"></div>
              </div>

              <div class="send-btn">
                <input type="submit" value="SEND MESSAGE" class="btn btn-theme">
              </div>

            </form>
          </div>
        </div>
        <!-- ./span12 -->
      </div>

    </div>
  </section>
  
  
	  <!-- Footer -->
	  
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <p>Copyright &copy; S. All rights reserved.</p>
        </div>
      </div>
    </div>
  </footer>

<script src="https://code.jquery.com/jquery-3.2.1.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 </body>
</html>