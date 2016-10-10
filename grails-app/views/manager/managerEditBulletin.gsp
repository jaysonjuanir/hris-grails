<!DOCTYPE html>
<html>
	<head>
		<title>Bulletin - Perfect Harmony</title>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
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
					
					<g:link action="index" class="pull-left header-link">
						<img class="header-logo" src="images/header-icon1.png"/>
					</g:link>
					
				</div>

				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-right">
						<li class="hidden active">
							<a data-scroll href="#page-top"></a>
						</li>
						<li>
							<g:link action="index">
								<span>Home</span>
							</g:link>
						</li>
						<li>
							<a href="${g.createLink(action:'index')}#bulletin">
								<span>Bulletin</span>
							</a>
						</li>
						<li>
							<a href="${g.createLink(action:'index')}#about">
								<span>About</span>
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
		
		
		
		<section class="header hris-section" id="contact" >
			<g:each var="err" in="${errors}" >
					<div class="column column-6"><h4 style="color:red">${err}</h4></div>
			</g:each>
			
			<div class="column column-6"><h4 style="color:green">${message}</h4></div>
			
			<div class="container">
				<div class="row">
		      <div class="col-md-12">
			      <h2><b>BULLETIN LIST</b></h2>
				  <a class="righButton" data-toggle="modal" data-target="#addBulletinModal">
					  Add Bulletin
				  </a>
			      <hr>
			      <div class="table-responsive">
	            <table id="mytable" class="table table-condensed table-bordered">
			          <theads>
			          	<tr>
	                 	<th class="col-md-3 text-center">Bulletin Type</th>
	                 	<th class="col-md-3 text-center">Bulletin Subject</th>
						<th class="col-md-3 text-center">Bulletin Message</th>
						<th class="col-md-3 text-center">Employee Name</th>
						<th class="col-md-3 text-center">Edit</th>
						<th class="col-md-3 text-center">Delete</th>
			          	</tr>
                </thead>
		  					<tbody>
								<g:each var="bul" in="${bulletin}" >
				  				<tr>
								
									
									  <td class="col-md-3 text-center">${bul.bulletinType}</td>
									  <td class="col-md-3 text-center">${bul.bulletinSubject}</td>
									  <td class="col-md-3 text-center">${bul.message}</td>
									  <td class="col-md-3 text-center">${bul.employeeName}</td>
									  <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Edit"><a  class="btn btn-success btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit${bul.id}" ><span class="glyphicon glyphicon-pencil"></span></a></p></td>
									  <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete${bul.id}" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
									  
									  <!--UPDATE EMPLOYEE MODAL-->
										<div id="edit${bul.id}" class="modal fade" role="dialog">
										  <div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title custom_align" id="Heading">Edit Employee</h4>
												</div>

												<!--modal body-->
												<div class="modal-body">
													<g:form action="updateBulletin" method="post" name="update${bul.id}">
													<div class="form-group">
														<g:textField class="form-control " name="bulletinType" placeholder="Bulletin Type" value="${bul.bulletinType}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="bulletinSubject" placeholder="Bulletin Subject" value="${bul.bulletinSubject}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="bulletinMessage" placeholder="Bulleting Message" value="${bul.message}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="employeeName" placeholder="Employee Name" value="${bul.employeeName}"required=""/>
													</div>
													
														<g:hiddenField name="id" value="${bul.id}" />
													</g:form>
												</div>
												
												<!--modal footer-->
												<div class="modal-footer ">
												<button form = "update${bul.id}" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Update Bulletin</button>
												</div>
											</div>
										  </div>
										</div>
									  
									  <!--DELETE MODAL-->
										  <div class="modal fade" id="delete${bul.id}" tabindex="-1" role="dialog" aria-labelledby="delete" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<!--modal header-->
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													<h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
													</div>
													<!--modal body-->
												<div class="modal-body">
														<div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
													</div>
													<!--modal footer-->
												  <div class="modal-footer ">
													<g:form action="deleteBulletin" method="post" name="formdel${bul.id}">
													<g:hiddenField name="id" value="${bul.id}"/><br/>
													</g:form>
													<button form="formdel${bul.id}" type="sumbit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</button>
													<button  type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span>No</button>
													</div>
											  </div><!-- end of modal-content --> 
												</div> <!-- end of modal-dialog --> 
										  </div> <!-- end of modal --> 
									
				  				</tr>
								</g:each>
			  				</tbody>      
							</table>
							<div class="clearfix"></div>
	          </div> <!--end of div table-->
		      </div> <!--end of column-->
				</div> <!--end of row-->
				<div class="row">
					<small class="pull-right">Perfect Harmony. Sing your feelings &copy;2016</small>
					<small class="pull-left">
						<span class="glyphicon glyphicon-envelope"></span>
						<a href="">Pamantasan ng Lungsod ng Valenzuela</a>
					</small>
				</div>
			</div> <!--end of container-->
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
		
		<div id="addBulletinModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title custom_align" id="Heading">Add Bulletin</h4>
				</div>

				<!--modal body-->
				<div class="modal-body">
					<g:form action="addBulletin" method="post" name="addBulletin">
					<div class="form-group">
						<g:textField class="form-control " name="bulletinType" placeholder="Bulletin Type" value="${bul?.bulletinType}" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="bulletinSubject" placeholder="Bulletin Subject" value="${bul?.bulletinSubject}" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="bulletinMessage" placeholder="Bulleting Message" value="${bul?.message}" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="employeeName" placeholder="Employee Name" value="${emp.name}" readonly=""/>
					</div>
					</g:form>
				</div>
				
				<!--modal footer-->
			<div class="modal-footer ">
				<button form="addBulletin" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Add Employee</button>
				</div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>