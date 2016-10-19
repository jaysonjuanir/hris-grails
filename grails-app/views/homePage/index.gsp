<!DOCTYPE html>
<html>
	<head>
		<title>Karaoke Avenue - Home</title>
		<meta charset="utf-8"/>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	    <meta name="viewport" content="width=device-width, initial-scale=1"/>
	    <!-- SCRIPTS -->
		<script src="${resource(dir: 'js', file: 'jquery.js')}"></script>
		<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
		<script src="${resource(dir: 'js', file: 'effects.js')}"></script>
		<script src="${resource(dir: 'dist/js', file: 'smooth-scroll.js')}"></script>

		<!-- Latest compiled and minified CSS -->
		<link href="${resource(dir: 'css', file: 'bootstrap.min.css')}" rel="stylesheet"/>
		<!-- Custom CSS -->
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'hris.css')}" type="text/css" />
		<!-- Favicon -->
		<link href="/hris/images/faviconn.ico" rel="shortcut icon" type="image/x-icon"></link>
		
	</head>

	<body id="page-top">
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
						<img class="header-logo" src="${resource(dir: 'images', file: 'header-icon1.png')}">
					</a>
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden active">
							<a data-scroll href="#page-top"></a>
						</li>
						<li>
							<a data-scroll href="#page-top">
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
							<a href="#" data-toggle="modal" data-target="#loginModal">
								<span>Login</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>

		<!-- HEADER -->
		<section id="home-top" class="header hris-section">
			<div class="container cont">
				<div class="row">
                                    <div class="anotherForText">
                                    
                                    </div>
				</div>
                                <div class="bg-forText">
					<h1 class="text-center big"><i>Karaoke Avenue</i></h1> 
					<h3 class="text-center">"09368114300/09061985139"</h3>
					<h3 class="text-center">71A East Kamias, Quezon City</h3>
                                        
                                    </div>
			</div>
		</section>
		<!-- BULLETIN-->
		<g:render template="/layouts/bulletin"/>
		<!-- ABOUT -->
		<g:render template="/layouts/about"/>
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
								</ul>
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="row">
							<p class="text-center text-white">Need to get in touch? Please fill out our form below and we'll contact you as soon as possible.</p>
						</div>
						<div class="row">
							<a href="#" data-toggle="modal" data-target="#loginModal"><h1>(Login First to send a message)</h1></a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<g:render template="/layouts/footer"/>

		<!-- Login Modal -->
		<div id="loginModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Login</h4>
		      </div>
		      <div class="modal-body">
		        <form role="form" >
							<div class="form-group">
							  <label for="email" style="color : black;">Username:</label>
								<g:textField type="text" name = "user" value = "" class="form-control" id="email"/>
							</div>
							<div class="form-group">
							  <label for="pwd" style="color : black;">Password:</label>
								<g:passwordField type="password" name = "pass" value = "" class="form-control" id="pwd"/><br/>
							</div>
							<g:actionSubmit action = "login" value = "Submit" class="btn btn-success"/>
						</form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>
		<footer id="footer">
		</footer>
	</body>
</html>