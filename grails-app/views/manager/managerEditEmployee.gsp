<!DOCTYPE html>
<html>
    <g:set var="employee" value="${employee}" />
    <head>
        <title>Edit - ${employee.name} - Karaoke Avenue</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        <link href="/hris/images/faviconn.ico" rel="shortcut icon" type="image/x-icon"></link>
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
                <div class="row tableDesign">
                    <div class="col-md-12">
                        <h2><b>EMPLOYEE LIST</b></h2>
                        <a class="btnn btn-concrete" style="width: 20%;left: 40%;" data-toggle="modal" data-target="#addEmployeeModal">
                            <i class="glyphicon glyphicon-plus"></i>Add Employee
                        </a>
                        <hr>
                        <div class="table-responsive">
                            <table id="mytable" class="table table-condensed table-bordered">
                                <theads>
                                    <tr>
                                        <th class="col-md-3 text-center">Full Name</th>
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


                                                <td class="col-md-3 text-center"><g:link action="employeeViews" id="${emp.id}" class="nameLink">${emp.name.firstName} ${emp.name.middleName} ${emp.name.lastName}</g:link></td>
                                                <td class="col-md-3 text-center">${emp.address}</td>
                                                <td class="col-md-3 text-center">${emp.contact}</td>
                                                <td class="col-md-3 text-center">${emp.position}</td>
                                                <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Edit"><a  class="btn btn-success btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit${emp.id}" ><span class="glyphicon glyphicon-pencil"></span></a></p></td>
                                                <td class="col-md-3 text-center"><p data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete${emp.id}" ><span class="glyphicon glyphicon-trash"></span></button></p></td>

<!--UPDATE EMPLOYEE MODAL-->
                                        <div id="edit${emp.id}1" class="modal fade" role="dialog">
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
                                        <!-- UPDATE MODAL -->
                                        <div class="modal fade" id="edit${emp.id}" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                        <!--modal header-->
                                                    <div class="modal-header">
                                                        <h2> Update Employee</h2>
                                                    </div>
                                                    <!--modal body-->
                                                    <div class="modal-body">
                                                        <div class="row text-justify"> 
                                                            <g:uploadForm action="update" method="post" name="update${emp.id}">
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">

                                                                        <h4><label style="color : black;">Full Name</label></h4>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="fname" style="color : black;">First Name:</label>
                                                                        <g:textField class="form-control " name="firstName" placeholder="First Name" value="${emp?.name.firstName}" required=""/>
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
                                                                                <g:field type="file" accept="image/png, image/jpeg, image/gif" name="avatar" required=""/> <!-- rename it -->
                                                                            </div>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="mname" style="color : black;">Middle Name:</label>
                                                                        <g:textField class="form-control " name="middleName" placeholder="Middle Name" value="${emp?.name.middleName}" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="lname" style="color : black;">Last Name:</label>
                                                                        <g:textField class="form-control " name="lastName" value="${emp?.name.lastName}" placeholder="Last Name" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                                <hr/>
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">

                                                                        <h4><label style="color : black;">Full Address</label></h4>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-12">
                                                                    <div class="form-group">
                                                                        <label for="streetName" style="color : black;">Street Name:</label>
                                                                        <g:textField class="form-control " name="streetName" value="${emp?.address.streetName}" placeholder="Street Name" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="barangay" style="color : black;">Barangay:</label>
                                                                        <g:textField class="form-control " name="barangay" value="${emp?.address.barangay}" placeholder="Barangay" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="city" style="color : black;">City:</label>
                                                                        <g:textField class="form-control " name="city" placeholder="City" required="" value="${emp?.address.city}" />
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
                                                                        <g:textField class="form-control " id="cont"name="contact" value="${emp?.contact}" placeholder="Contact" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="bdate" style="color : black;">Date of Birth:</label><div class="clearfix"></div>
                                                                        <g:datePicker class="form-control" name="birthday" value="${emp?.birthday}" precision="day" years="${1970..2016}"/>

                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="position" style="color : black;">Position:</label>
                                                                        <g:textField class="form-control " name="position" placeholder="Position" value="${emp?.position}" required=""/>
                                                                    </div>
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="sss" style="color : black;">SSS Number:</label>
                                                                        <g:textField class="form-control " name="sss" placeholder="SSS" value="${emp?.sss}" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="bir" style="color : black;">BIR Number:</label>
                                                                        <g:textField class="form-control " name="bir" placeholder="bir" value="${emp?.bir}" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="tin" style="color : black;">TIN:</label>
                                                                        <g:textField class="form-control " name="tin" placeholder="TIN" value="${emp?.tin}" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="philHealth" style="color : black;">PhilHealth Number:</label>
                                                                        <g:textField class="form-control " name="philHealth" placeholder="Phil Health" value="${emp?.philHealth}" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="hdmf" style="color : black;">HDMF Number:</label>
                                                                        <g:textField class="form-control " name="pagibig" placeholder="Phil Health" value="${emp?.pagibig}" required=""/>
                                                                    </div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                                <hr>

                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="education" style="color : black;">Education Records:</label>
                                                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="tor"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="performanceAssessment" style="color : black;">Performance Assessment:</label>
                                                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="performanceAssessment" id="performanceAssessment"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="clearance" style="color : black;">Clearance: </label>
                                                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="clearance" id="clearance"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="correctiveActions" style="color : black;">Corrective Actions: </label>
                                                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="correctiveActions" id="correctiveActions"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="workHistory" style="color : black;">Work History:</label>
                                                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="workHistory" id="workHistory"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="postEmployment" style="color : black;">Post Employments:</label>
                                                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="postEmployment" id="postEmployment"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="hiringRequirements" style="color : black;">Hiring Requirements:</label>
                                                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="hiringRequirements" id="hiringRequirements"/>
                                                                    </div>
                                                                </div>
                                                                <div class="col-lg-6">
                                                                    <div class="form-group">
                                                                        <label for="jobDescription" style="color : black;">Job Description:</label>
                                                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="jobDescription" id="jobDescription"/>
                                                                    </div>
                                                                </div>
                                                                <div class="clearfix"></div>
                                                                <hr>
                                                                <g:hiddenField type="hidden" name="id" value="${emp?.id}"/>
                                                                <button class="btn btn-warning btn-lg" style="width: 100%;margin:2%;"><span class="glyphicon glyphicon-ok-sign"></span>Update Employee</button>
                                                            </g:uploadForm>
                                                        </div>
                                                    </div>
                                                    <!--modal footer-->
                                                    <div class="modal-footer ">
                                                        <!--<button form = "update${emp.id}" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Update Employee</button>-->
                                                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Close</button>
                                                    </div>
                                                </div><!-- end of modal-content --> 
                                            </div> <!-- end of modal-dialog --> 
                                        </div> <!-- end of modal --> 

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
                    <small class="pull-right">Karaoke Avenue. Sing your feelings &copy; 2016</small>
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
                            <g:uploadForm action="add" method="post" name="addEmployee">
                                <div class="col-lg-12">
                                    <div class="form-group">

                                        <h4><label style="color : black;">Full Name</label></h4>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="fname" style="color : black;">First Name:</label>
                                        <g:textField class="form-control " name="firstName" placeholder="First Name"  required=""/>
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
                                                <g:field type="file" accept="image/png, image/jpeg, image/gif" name="avatar"/> <!-- rename it -->
                                            </div>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="mname" style="color : black;">Middle Name:</label>
                                        <g:textField class="form-control " name="middleName" placeholder="Middle Name"  required=""/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="lname" style="color : black;">Last Name:</label>
                                        <g:textField class="form-control " name="lastName"  placeholder="Last Name" required=""/>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <hr/>
                                <div class="col-lg-12">
                                    <div class="form-group">

                                        <h4><label style="color : black;">Full Address</label></h4>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <label for="streetName" style="color : black;">Street Name:</label>
                                        <g:textField class="form-control " name="streetName" placeholder="Street Name" required=""/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="barangay" style="color : black;">Barangay:</label>
                                        <g:textField class="form-control " name="barangay" placeholder="Barangay" required=""/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="city" style="color : black;">City:</label>
                                        <g:textField class="form-control " name="city" placeholder="City" required="" />
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
                                        <g:textField class="form-control " id="cont"name="contact" placeholder="Contact" required=""/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="bdate" style="color : black;">Date of Birth:</label><div class="clearfix"></div>
                                        <g:datePicker class="form-control" name="birthday" precision="day" years="${1970..2016}"/>

                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="position" style="color : black;">Position:</label>
                                        <g:textField class="form-control " name="position" placeholder="Position" required=""/>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="sss" style="color : black;">SSS Number:</label>
                                        <g:textField class="form-control " name="sss" placeholder="SSS" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="bir" style="color : black;">BIR Number:</label>
                                        <g:textField class="form-control " name="sss" placeholder="SSS" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="tin" style="color : black;">TIN:</label>
                                        <g:textField class="form-control " name="tin" placeholder="TIN" />
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="philHealth" style="color : black;">PhilHealth Number:</label>
                                        <g:textField class="form-control " name="philHealth" placeholder="Phil Health"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="hdmf" style="color : black;">HDMF Number:</label>
                                        <g:textField class="form-control " name="pagibig" placeholder="Phil Health"/>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <hr>

                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="education" style="color : black;">Education Records:</label>
                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="tor"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="performanceAssessment" style="color : black;">Performance Assessment:</label>
                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="performanceAssessment" id="performanceAssessment"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="clearance" style="color : black;">Clearance: </label>
                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="clearance" id="clearance"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="correctiveActions" style="color : black;">Corrective Actions: </label>
                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="correctiveActions" id="correctiveActions"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="workHistory" style="color : black;">Work History:</label>
                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="workHistory" id="workHistory"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="postEmployment" style="color : black;">Post Employments:</label>
                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="postEmployment" id="postEmployment"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="hiringRequirements" style="color : black;">Hiring Requirements:</label>
                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="hiringRequirements" id="hiringRequirements"/>
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="form-group">
                                        <label for="jobDescription" style="color : black;">Job Description:</label>
                                        <g:field type="file" accept="application/msword, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/pdf" class="form-control" name="jobDescription" id="jobDescription"/>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                                <hr>

                                <div class="col-lg-12">
                                    <div class="form-group">

                                        <h4><label style="color : black;">Register Account:</label></h4>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="education" style="color : black;">Username:</label>
                                                <g:textField class="form-control " name="username" placeholder="Username" required=""/>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="education" style="color : black;">Password:</label>
                                                <g:passwordField class="form-control " name="password" placeholder="Password" required=""/>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <div class="form-group">
                                                <label for="education" style="color : black;">Confirm Password:</label>
                                                <g:passwordField class="form-control " name="password2" placeholder="Confirm Password" required=""/>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <button class="btn btn-warning btn-lg" style="width: 95%;margin:2%;"><span class="glyphicon glyphicon-ok-sign"></span>Add Employee</button>
                            </g:uploadForm>
                        </div>
                    </div>
                    <!--modal footer-->
                    <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Close</button>
                    </div>
                </div><!-- end of modal-content --> 
            </div> <!-- end of modal-dialog --> 
        </div> <!-- end of modal --> 
    </body>
</html>