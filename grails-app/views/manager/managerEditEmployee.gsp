<!DOCTYPE html>
<html>
	<g:set var="employee" value="${employee}" />
	<g:set var="employeeName" value="${employee.name}"/>
	<g:set var="employeeAddress" value="${employee.address}"/>
	<g:set var="employeeContact" value="${employee.contact}"/>
	<g:set var="employeePosition" value="${employee.position}"/>
	<head>
		<title>Edit - ${employee.name} - Perfect Harmony</title>
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
		<script>
	$(document).ready(function(){
		$("#mytable #checkall").click(function () {
      if ($("#mytable #checkall").is(':checked')) {
        $("#mytable input[type=checkbox]").each(function () {
          $(this).prop("checked", true);
        });

      }
      else {
        $("#mytable input[type=checkbox]").each(function () {
          $(this).prop("checked", false);
        });
      }
	    });
    $("[data-toggle=tooltip]").tooltip();
	});

	//images
	$(document).on('click', '#close-preview', function(){ 
    $('.image-preview').popover('hide');
    // Hover befor close the preview
    $('.image-preview').hover(
      function () {
        $('.image-preview').popover('show');
      }, 
      function () {
        $('.image-preview').popover('hide');
      }
    );    
	});

	$(function() {
	  // Create the close button
    var closebtn = $('<button/>', {
        type:"button",
        text: 'x',
        id: 'close-preview',
        style: 'font-size: initial;',
    });
    closebtn.attr("class","close pull-right");
    // Set the popover default content
    $('.image-preview').popover({
      trigger:'manual',
      html:true,
      title: "<strong>Preview</strong>"+$(closebtn)[0].outerHTML,
      content: "There's no image",
      placement:'bottom'
    });
    // Clear event
    $('.image-preview-clear').click(function(){
      $('.image-preview').attr("data-content","").popover('hide');
      $('.image-preview-filename').val("");
      $('.image-preview-clear').hide();
      $('.image-preview-input input:file').val("");
      $(".image-preview-input-title").text("Browse"); 
    }); 
    // Create the preview image
    $(".image-preview-input input:file").change(function (){     
      var img = $('<img/>', {
        id: 'dynamic',
        width:250,
        height:200
      });      
      var file = this.files[0];
      var reader = new FileReader();
      // Set preview image into the popover data-content
      reader.onload = function (e) {
        $(".image-preview-input-title").text("Change");
        $(".image-preview-clear").show();
        $(".image-preview-filename").val(file.name);            
        img.attr('src', e.target.result);
        $(".image-preview").attr("data-content",$(img)[0].outerHTML).popover("show");
      }        
      reader.readAsDataURL(file);
    });  
	});

	function call(){
	 var kcyear = document.getElementsByName("year")[0],
	  kcmonth = document.getElementsByName("month")[0],
	  kcday = document.getElementsByName("day")[0];
	       
	 var d = new Date();
	 var n = d.getFullYear();
	 for (var i = n; i >= 1950; i--) {
	  var opt = new Option();
	  opt.value = opt.text = i;
	  kcyear.add(opt);
	    }
	 kcyear.addEventListener("change", validate_date);
	 kcmonth.addEventListener("change", validate_date);

	 function validate_date() {
	 var y = +kcyear.value, m = kcmonth.value, d = kcday.value;
	 if (m === "2")
	     var mlength = 28 + (!(y & 3) && ((y % 100) !== 0 || !(y & 15)));
	 else var mlength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31][m - 1];
	 kcday.length = 0;
	 for (var i = 1; i <= mlength; i++) {
	     var opt = new Option();
	     opt.value = opt.text = i;
	     if (i == d) opt.selected = true;
	     kcday.add(opt);
	 }
	     }
	    validate_date();
  }
	</script>
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
						<img class="header-logo"  src="${resource(dir: 'images', file: 'header-icon1.png')}"/>
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
			      <h2><b>EMPLOYEE LIST</b></h2>
				  <a class="btnn btn-concrete" style="width: 20%;left: 40%;" data-toggle="modal" data-target="#addEmployeeModal">
					  Add Employee
				  </a>
			      <hr>
			      <div class="table-responsive">
	            <table id="mytable" class="table table-condensed table-bordered">
			          <theads>
			          	<tr>
	                 	<th class="col-md-3 text-center">First Name</th>
	                 	<th class="col-md-3 text-center">Middle Name</th>
						  <th class="col-md-3 text-center">Last Name</th>
						  <th class="col-md-3 text-center">Address</th>
						  <th class="col-md-3 text-center">Contact</th>
						  <th class="col-md-3 text-center">Position</th>
						  <th class="col-md-3 text-center">Edit</th>
						<th class="col-md-3 text-center">Delete</th>
			          	</tr>
                </thead>
		  					<tbody>
							<g:each var="emp" in="${employees}">
				  				<tr>
								
									
									  <td class="col-md-3 text-center">${emp.name.firstName}</td>
									  <td class="col-md-3 text-center">${emp.name.middleName}</td>
									  <td class="col-md-3 text-center">${emp.name.lastName}</td>
									  <td class="col-md-3 text-center">${emp.address}</td>
									  <td class="col-md-3 text-center">${emp.contact}</td>
									  <td class="col-md-3 text-center">${emp.position}</td>
									  <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Edit"><a  class="btn btn-success btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit${emp.id}" ><span class="glyphicon glyphicon-pencil"></span></a></p></td>
									  <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete${emp.id}" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
									  
									  <!--UPDATE EMPLOYEE MODAL-->
										<div id="edit${emp.id}" class="modal fade" role="dialog">
										  <div class="modal-dialog">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
												<h4 class="modal-title custom_align" id="Heading">Update Employee</h4>
												</div>

												<!--modal body-->
												<div class="modal-body">
													<g:form action="update" method="post" name="update${emp.id}">
													<div class="form-group">
														<g:textField class="form-control " name="firstName" placeholder="First Name" value="${emp?.name.firstName}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="middleName" placeholder="Middle Name" value="${emp?.name.middleName}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="lastName" placeholder="Last Name" value="${emp?.name.lastName}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="streetName" placeholder="Street Name" value="${emp?.address.streetName}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="barangay" placeholder="Barangay" value="${emp?.address.barangay}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="city" placeholder="City" value="${emp?.address.city}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="contact" placeholder="Contact" value="${emp?.contact}" required=""/>
													</div>
													<div class="form-group">
														<g:textField class="form-control " name="position" placeholder="Position" value="${emp?.position}" required=""/>
													</div>
													<g:hiddenField type="hidden" name="id" value="${emp?.id}"/>
													</g:form>
												</div>
												
												<!--modal footer-->
												<div class="modal-footer ">
												<button form = "update${emp.id}" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Update Employee</button>
												</div>
											</div>
										  </div>
										</div>
									  
									  <!--DELETE MODAL-->
										  <div class="modal fade" id="delete${emp.id}" tabindex="-1" role="dialog" aria-labelledby="delete" aria-hidden="true">
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
													
													<g:form action="delete" method="post" name="del${emp.id}">
														<input type="hidden" name="id" value="${emp.id}"/><br/>
													</g:form>
													<button form="del${emp.id}" type="sumbit" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>Yes</button>
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
					<hr>
				</div>
				<div class="row">
					<small class="pull-right">Perfect Harmony. Sing your feelings &copy; 2016</small>
					<small class="pull-left">
						<span class="glyphicon glyphicon-envelope"></span>
						<a href="http://plv.edu.ph/" target="_blank">Pamantasan ng Lungsod ng Valenzuela</a>
						<span>&nbsp;&bull;&nbsp;</span>
						<a href="#" data-toggle="modal" data-target="#changeUserModal">Change password</a>
					</small>
					<small class="pull-left">
						
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
		
				 <div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
		    <div class="modal-dialog">
		  		<div class="modal-content">
		  			<!--modal header-->
	        	<div class="modal-header">
			      	<h2> Create An Employee</h2>
			    	</div>
			    	<!--modal body-->
		        <div class="modal-body">
		        	<div class="row text-justify">
		        		<form role="form">
							<div class="col-lg-12">
								<div class="form-group">

									<h4><label style="color : black;">Full Name</label></h4>
								</div>
							</div>
		        			<div class="col-lg-6">
		        				<div class="form-group">
										  <label for="fname" style="color : black;">First Name:</label>
										  <input type="text" class="form-control" id="fname">
										</div>
		        			</div>
		        			<div class="col-lg-6">
		        				<div class="form-group image-preview">
		        					<label for="prof-pic" style="color : black;">Profile Picture:</label>
			                <input type="text" class="form-control image-preview-filename" disabled="disabled" id="prof-pic"> <!-- don't give a name === doesn't send on POST/GET -->
			                <span class="form-group-btn">
		                    <!-- image-preview-clear button -->
		                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
	                        <span class="glyphicon glyphicon-remove"></span> Clear
		                    </button>
		                    <!-- image-preview-input -->
		                    <div class="btn btn-default image-preview-input">
	                        <span class="glyphicon glyphicon-folder-open"></span>
	                        <span class="image-preview-input-title">Browse</span>
	                        <input type="file" accept="image/png, image/jpeg, image/gif" name="input-file-preview"/> <!-- rename it -->
		                    </div>
				                </span>
				            </div>
		        			</div>
		        			<div class="col-lg-6">
		        				<div class="form-group">
										  <label for="mname" style="color : black;">Middle Name:</label>
										  <input type="text" class="form-control" id="mname">
										</div>
		        			</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="lname" style="color : black;">Last Name:</label>
										  <input type="text" class="form-control" id="lname">
										</div>
									</div>
									<div class="clearfix"></div>
									<hr/>
									<div class="col-lg-12">
										<div class="form-group">
											
											<h4><label style="color : black;">Full Address</label></h4>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="streetName" style="color : black;">Street Name:</label>
										 	<input type="text" class="form-control" id="streetName">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="barangay" style="color : black;">Barangay:</label>
										 	<input type="text" class="form-control" id="streetName">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="city" style="color : black;">City:</label>
										 	<input type="text" class="form-control" id="city">
										</div>
									</div>
									
									<div class="clearfix"></div>
									<hr>
							
									<div class="col-lg-12">
										<div class="form-group">
											
											<h4><label style="color : black;">Other Information</label></h4>
										</div>
									</div>
								
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="contact" style="color : black;">Contact Number:</label>
										  <input type="text" class="form-control" id="contact">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
											<label for="bdate" style="color : black;">Date of Birth:</label>
											<div class="form-control"><select name="month" onchange="call()" >
								         <option value="">Month</option>
								         <option value="1">Jan</option>
								         <option value="2">Feb</option>
								         <option value="3">Mar</option>
								         <option value="4">Apr</option>
								         <option value="5">May</option>
								         <option value="6">Jun</option>
								         <option value="7">Jul</option>
								         <option value="8">Aug</option>
								         <option value="9">Sep</option>
								         <option value="10">Oct</option>
								         <option value="11">Nov</option>
								         <option value="12">Dec</option>
								        </select>
								        <select name="day" >
								          <option value="">Day</option>
								         </select>
								        <select name="year" onchange="call()">
								          <option value="">Year</option>
								         </select>
								       </div>
										</div>
									</div>
								
									
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="sss" style="color : black;">SSS Number:</label>
										  <input type="text" class="form-control" id="sss">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="bir" style="color : black;">BIR Number:</label>
										  <input type="text" class="form-control" id="bir">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="tin" style="color : black;">TIN Number:</label>
										  <input type="text" class="form-control" id="tin">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="phil-health" style="color : black;">PhilHealth Number:</label>
										  <input type="text" class="form-control" id="phil-health">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="hdmf" style="color : black;">HDMF Number:</label>
										  <input type="text" class="form-control" id="hdmf">
										</div>
									</div>
									<div class="clearfix"></div>
									<hr>

									<div class="col-lg-6">
										<div class="form-group">
										  <label for="education" style="color : black;">Education/Transcript/Diploma:</label>
										  <input type="file" class="form-control" id="education">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="education" style="color : black;">Performance Assessment:</label>
										  <input type="file" class="form-control" id="education">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="education" style="color : black;">Clearance: </label>
										  <input type="file" class="form-control" id="education">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="education" style="color : black;">Work History:</label>
										  <input type="file" class="form-control" id="education">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="education" style="color : black;">Post Employments:</label>
										  <input type="file" class="form-control" id="education">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="education" style="color : black;">Hiring Requirements:</label>
										  <input type="file" class="form-control" id="education">
										</div>
									</div>
									<div class="col-lg-6">
										<div class="form-group">
										  <label for="education" style="color : black;">Job Description:</label>
										  <input type="file" class="form-control" id="education">
										</div>
									</div>
								</form>
		        	</div>
			    	</div>
			    	<!--modal footer-->
			      <div class="modal-footer ">
			      	<button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span>Save</button>
			      	<button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Close</button>
			    	</div>
		      </div><!-- end of modal-content --> 
				</div> <!-- end of modal-dialog --> 
		  </div> <!-- end of modal --> 
				
		<div id="addEmployeeModal1" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title custom_align" id="Heading">Add Employee</h4>
				</div>

				<!--modal body-->
				<div class="modal-body">
					<g:form action="add" name="addEmployee">
					<div class="form-group">
						<g:textField class="form-control " name="firstName" placeholder="First Name" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="middleName" placeholder="Middle Name" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="lastName" placeholder="Last Name" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="streetName" placeholder="Street Name" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="barangay" placeholder="Barangay" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="city" placeholder="City" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="contact" placeholder="Contact" required=""/>
					</div>
					<div class="form-group">
						<g:textField class="form-control " name="position" placeholder="Position" required=""/>
					</div>
					
					
					<h4 class="modal-title custom_align" id="Heading">Username and Password</h4>
					<div class="form-group">
						<g:textField class="form-control " name="username" placeholder="Username" required=""/>
					</div>
					<div class="form-group">
						<g:passwordField class="form-control " name="password" placeholder="Password" required=""/>
					</div>
					<div class="form-group">
						<g:passwordField class="form-control " name="password2" placeholder="Confirm Password" required=""/>
					</div>
					</g:form>
				</div>
				
				<!--modal footer-->
				<div class="modal-footer ">
				<button form="addEmployee" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Add Employee</button>
				</div>
		    </div>
		  </div>
		</div>
		
	</body>
</html>