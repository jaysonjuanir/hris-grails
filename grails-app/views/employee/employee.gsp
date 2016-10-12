
<!DOCTYPE html>
<html>
	<head>
		<title>${employee.name} - Perfect Harmony</title>
		<meta charset="utf-8"/>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	    <!-- SCRIPTS -->
		<script src="/hris/js/jquery.js"></script>
		<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'effects.js')}"></script>
		<script src="${resource(dir: 'dist/js', file: 'smooth-scroll.js')}"></script>

		<!-- Latest compiled and minified CSS -->
		<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet"/>
		<!-- Custom CSS -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'hris.css')}" type="text/css" />
		<!-- Favicon -->
		<link href="/hris/images/favicon.ico" rel="shortcut icon" type="image/x-icon"></link>
	</head>

	<body id="page-top">
	
		<!-- variable initialization -->
		
	
		<!-- NAVIGATION -->
		<nav class="navbar transparent navbar-default navbar-fixed-top">
			<div class="container">
				<div class="navbar-header page-scroll">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle Navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a data-scroll class="pull-left header-link" href="#page-top">
						<img class="header-logo" src="${resource(dir: 'images', file: 'header-icon1.png')}"/>
					</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden active">
							<a data-scroll href="#page-top"></a>
						</li>
						<li>
							<a data-scroll href="#home">
								<span>Home</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#bulletin">
								<span>Bulletin</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#about">
								<span>About</span>
							</a>
						</li>
						<li>
							<a data-scroll href="#contact">
								<span>Contact Us</span>
							</a>
						</li>
						<li>
							<a data-toggle="modal" data-target="#loginModal">
								<span>Logout</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- HEADER -->
		<section id="home" class="header hris-section" style="background-image : url('${resource(dir: 'images', file: 'employee-bg.jpg')}')">
			<g:each var="err" in="${errors}" >
					<div class="column column-6"><h4 style="color:red">${err}</h4></div>
			</g:each>
			
			<div class="column column-6"><h4 style="color:green">${message}</h4></div>
			<div class="container">
				<div class="row">
					<span></span>
					<h2 class="text-left" style="margin-top:0px; color:black;">Welcome ${employee.name.firstName} </h2> 	
					
					<h4 class="text-left" style="margin-top:0px; color:black;">Full Name: ${employee.name} </h4>
					
					<h4 class="text-left" style="margin-top:0px; color:black;">Address: ${employee.address} </h4>
					
					<h4 class="text-left" style="margin-top:0px; color:black;">Contact Number: ${employee.contact} </h4>
					
					<h4 class="text-left" style="margin-top:0px; color:black;">Position: ${employee.position} </h4>
				</div>
			</div>
		</section>
		<!-- BULLETIN-->
		<section id="bulletin" class="hris-section">
			<div class="container" id="offset-top">
				<div class="row">
					<h1>Bulletin</h1>
					<hr/>
					<!--ANNOUNCEMENTS CAROUSEL-->
					<div id="announcementCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
						  <li data-target="#announcementCarousel" data-slide-to="0" class="active"></li>
						  <li data-target="#announcementCarousel" data-slide-to="1"></li>
						  <li data-target="#announcementCarousel" data-slide-to="2"></li>
						</ol>

						<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox">
						  <div class="item active">
						    <div class="row alert alert-success" style ="border:1px solid orange;">
						    	<h3>Announcements!</h3>
								<g:each in="${bulletin}" var="blog">
									<g:if test="${blog.bulletinType==('announcement')}">
										<div class="col-xs-6">
											<h4 class=""> <b>Posted By: ${blog.employeeName}</b> </h4>
											<span class="text-center big" ><b>Title:</b> ${blog.bulletinSubject}</span>
										</div>
										<br/>
										<br/>
										<div class="text-center">
											
											<p>${blog.message}</p>
										</div>
										<hr/>
									</g:if>
								</g:each>
									
						    </div>
						  </div>

						  <div class="item">
						    <div class="row alert alert-warning" style ="border:1px solid orange;" >
						    	<h3>Updates</h3>
						    	<g:each var="blog" in="${bulletin}" >
									<g:if test="${blog.bulletinType.equals('update')}">
										<div class="col-xs-6">
											<h4 class=""> <b>Posted By: ${blog.employeeName}</b> </h4>
											<span class="text-center big" ><b>Title:</b> ${blog.bulletinSubject}</span>
										</div>
										<br/>
										<br/>
										<div class="text-center">
											
											<p>${blog.message}</p>
										</div>
										<hr/>
									</g:if>
								</g:each>
						    </div>
						  </div>

						  <div class="item">
						    <div class="row alert alert-danger" style ="border:1px solid orange;">
						    	<h3>News</h3>
						    	<g:each var="blog" in="${bulletin}" >
									<g:if test="${blog.bulletinType.equals('news')}">
										<div class="col-xs-6">
											<h4 class=""> <b>Posted By: ${blog.employeeName}</b> </h4>
											<span class="text-center big" ><b>Title:</b> ${blog.bulletinSubject}</span>
										</div>
										<br/>
										<br/>
										<div class="text-center">
											
											<p>${blog.message}</p>
										</div>
										<hr/>
									</g:if>
								</g:each>
						    </div>
						  </div>

						</div>
						
						<!-- Left and right controls -->
						<a class="left carousel-control" href="#announcementCarousel" role="button" data-slide="prev">
						  <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						  <span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#announcementCarousel" role="button" data-slide="next">
						  <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						  <span class="sr-only">Next</span>
						</a>
						
					</div>
				</div>
			</div>
		</section>
		<!-- ABOUT-->
		<section id="about" class="hris-section">
			<div class="container" id="offset-top">
				<div class="row">
					<h1>About</h1>
					<img class="header-logo" src="${resource(dir: 'images', file: 'header-icon1.png')}">
				</div>
				
				<div class="row">
					<h3>Vision:</h3>
					<p>A leading Karaoke bar in Valenzuela that is vibrant center of enjoyment and interactive entertainment that establish a best quality of service for our customers.</p>
				</div>
				<div class="row">
					<h3>Mission:</h3>
					<p>To provide a place for customer’s satisfaction by giving them a high quality of entertainment while founding a triumph relationship to our beloved customers</p>
				</div>
				

				
			</div>
		</section>

		<!-- CONTACT US -->
		<section id="contact" class="contact-section hris-section">
			<div class="container" id="offset-top">
				<div class="row">
					<h2 class="text-white">Contact Us</h2>
				</div>
				<div class="row"><hr></div>
				<div class="row">
					<div class="col-lg-5 col-md-5 col-sm-5">
						<div class="row">
							<div class="col-lg-12">
								<ul class="contact-list text-left">
									<strong>Valenzuela City, Philippines</strong>
									<li>Pamantasan ng Lungsod ng Valenzuela</li>
									<li>Contact Person:</li>
									<li>Mobile Number: </li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="row">
							<p class="text-center text-white">Need to get in touch? Please fill out our form below and we'll contact you as soon as possible.</p>
						</div>
						<div class="row">
							<g:form id="contact-form" method="post" action="sendMessage" role="form">
								<div class="messages"></div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<!-- <label for="form_name">First Name</label> -->
              									<g:textField readonly="" name = "firstName" value = "${employee.name.firstName}" class="form-control" placeholder="First name *" data-error="First name is required."/>
            						<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<!-- <label for="form_lastname">Last Name</label> -->
											<g:textField readonly = "" name = "lastName" value = "${employee.name.lastName}" class="form-control" placeholder="Last name *" data-error="Last name is required."/>
											<div class="help-block with-errors"></div>
											</div>
											</div>
									</div>

									<div class="row">
										<div class="col-lg-12">
											<div class="form-group">
												<!-- <label for="form_message">Message</label> -->
            										<g:textField rows="8" name = "message" value = "" class="form-control" placeholder="Message *" required="required" data-error="Message is required." style="resize:none;"/>
												<div class="help-block with-errors"></div>
											</div>
										</div>
										<div class="col-lg-12">
											<input type="hidden" name="action" value="sendMessage">
											<input type="submit" class="btn btn-success btn-send pull-right" value="Submit">
										</div>
									</div>
							</g:form>
						</div>
					</div>
				</div>
				<div class="row">
					<hr>
				</div>
				<div class="row">
					<small class="pull-right">Perfect Harmony. Sing your feelings © 2016</small>
					<small class="pull-left">
						<span class="glyphicon glyphicon-envelope"></span>
						<a href="http://plv.edu.ph/" target="_blank">Pamantasan ng Lungsod ng Valenzuela</a>
						<span>&nbsp;&bull;&nbsp;</span>
						<a href="#" data-toggle="modal" data-target="#changeUserModal">Change password</a>
					</small>
					<small class="pull-left">
						
					</small>
				</div>
			</div>
		</section>
		
		<div id="loginModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Logout</h4>
		      </div>
		      <div class="modal-body">
			  	<g:link action="logout" class="btn btn-success">Yes</g:link>
				<button type="button" class="btn btn-danger" data-dismiss="modal">No</button>
		      </div>
		      <div class="modal-footer">
		        
		      </div>
		    </div>
		  </div>
		</div>
		
		<div id="changeUserModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
		    <!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Change Password</h4>
					</div>
					<div class="modal-body">
						<!--modal body-->
						<div class="modal-body">
							<g:form action="changePass" name="changeUser">
							<div class="form-group">
								<g:passwordField class="form-control " name="oldPass" placeholder="Enter Old Password" required=""/>
							</div>
							<div class="form-group">
								<g:passwordField class="form-control " name="newPass" placeholder="Enter New Password" required=""/>
							</div>
							<div class="form-group">
								<g:passwordField class="form-control " name="newPass2" placeholder="Confirm New Password" required=""/>
							</div>
							<g:hiddenField name="id" value="${employee.accountId}"/>
							</g:form>
						</div>
					</div>
					<div class="modal-footer">
					<button form="changeUser" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Submit</button>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>