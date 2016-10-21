
<!DOCTYPE html>
<html>

    <head>
        <title>${employee.name} - Karaoke Avenue</title>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <!-- SCRIPTS -->
    <ckeditor:resources/>
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
</head>

<body id="home">
        <!-- NAVIGATION -->
    <nav class="navbar transparent navbar-default navbar-fixed-top">
        <div class="container" >
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a data-scroll class="pull-left header-link" href="#home">
                    <img class="header-logo" src="${resource(dir: 'images', file: 'header-icon1.png')}"/>
                </a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden active">
                        <a data-scroll href="#home"></a>
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
                        <a data-toggle="modal" data-target="#loginModal">
                            <span>Logout</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

                <!-- HEADER -->
    <section class="header hris-section" style="background-image : url('${resource(dir: 'images', file: 'hris-header.png')}')">
        <div class="container" style="position: relative;top: 25%;width:100%">
            <div>
                <div class="span9">
                    <g:if test="${flash.message}">
                        <div class="alert alert-info" role="status">
                            <strong>
                                ${flash.message}
                            </strong>
                        </div>
                    </g:if>
                    <g:if test="${flash.success}">
                        <div class="alert alert-success" role="status">
                            <strong>
                                ${flash.success}
                            </strong>
                        </div>
                    </g:if>
                    <g:if test="${flash.error}">
                        <div class="alert alert-error" role="status">
                            <strong>
                                ${flash.error}
                            </strong>
                        </div>
                    </g:if>
                    <g:if test="${flash.warning}">
                        <div class="alert alert-warning" role="status">
                            <strong>
                                ${flash.warning}
                            </strong>
                        </div>
                    </g:if>
                </div>
            </div>
            <div class="row">
                <h2 class="text-center" style="width: 65%;margin-top: 0px;color: black;padding: 4% 4%;background-color: #fff;opacity: 0.7;">Welcome ${employee.name.toString()}</h2> 
            </div>

            <div class="row">

                <div class="col five">			
                    <g:link action="editEmployee" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="glyphicon glyphicon-list-alt"></i> 201 File</g:link>			
                    </div>

                <div class="col five">
                    <g:link action="download" params="[title: 'Termination and Salary.docx', path: 'uploads/payroll']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="glyphicon glyphicon-usd"></i> Termination and Salary</g:link>			
                    </div>

                <div class="col five">
                    <g:link action="download" params="[title: 'Attendance.xlsx', path: 'uploads/attendance']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="glyphicon glyphicon-list"></i> Attendance</g:link>						
                    </div>

                <div class="col five">
                    <g:link action="download" params="[title: 'Company Policies.docx', path: 'uploads/companypolicies']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="glyphicon glyphicon-info-sign"></i> Company Policies</g:link>			
                    </div>
                    <div class="col five">			
                    <g:link action="download" params="[title: 'Sanctions and Violations.docx', path: 'uploads/sanctions']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="glyphicon glyphicon-warning-sign"></i> Sanctions and Violations</g:link>			
                    </div>

                <div class="col five">
                    <a style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete" data-toggle="modal" data-target="#loginModal"><i class="glyphicon glyphicon-log-out"></i> Logout</a>			
                </div>
            </div>
        </div>
    </section>

    <div class="container"style="margin-top:3%;">
        <div class="row" style="background-color: #cac7c7;border-radius: 25px;border-bottom: solid 2px rgba(0,0,0,.25);">
            <div class="col-md-12">
                <h2 style="float: left;margin: 2% 5%;"><b>EMPLOYEE LIST</b></h2>
                <br/>
                <g:link action="editEmployee" style="width: 20%;float: right;" class="btnn btn-concrete" role="button" ><i class="glyphicon glyphicon-edit"></i>Edit Employee</g:link>
                    <hr>
                    <br/>
                    <br/>
                    <div class="table-responsive">
                        <table id="mytable" class="table table-condensed table-bordered">
                            <thead>
                                <tr>
                                    <th class="col-md-3 text-center">Profile Picture</th>
                                    <th class="col-md-3 text-center">First Name</th>
                                    <th class="col-md-3 text-center">Middle Name</th>
                                    <th class="col-md-3 text-center">Last Name</th>
                                    <th class="col-md-3 text-center">Address</th>
                                    <th class="col-md-3 text-center">Contact</th>
                                    <th class="col-md-3 text-center">Position</th>
                                </tr>
                            </thead>
                            <tbody>
                            <g:each var="emp" in="${employees}">
                                <tr>
                                    <%
                                        File file = new File(emp.avatar);
                                        def pic = file.getName();
                                    %>
                                    <td class="col-md-3 text-center"><img src="${resource(dir: 'uploads/avatar', file: "${pic}")}" class="img-responsive" style="height: 100px;width: 100px;margin: 0% 20%;"/></td>
                                    <td class="col-md-3 text-center">${emp.name.firstName}</td>
                                    <td class="col-md-3 text-center">${emp.name.middleName}</td>
                                    <td class="col-md-3 text-center">${emp.name.lastName}</td>
                                    <td class="col-md-3 text-center">${emp.address.toString()}</td>
                                    <td class="col-md-3 text-center">${emp.contact}</td>
                                    <td class="col-md-3 text-center">${emp.position}</td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                    <div class="clearfix"></div>
                </div> <!--end of div table-->
            </div> <!--end of column-->
        </div> <!--end of row-->
    </div> <!--end of container-->


<!-- BULLETIN -->

    <g:render template="/layouts/bulletin"/>

    <div class="container">
        <div class="row" style="background-color: #b3deb6;border-radius: 25px;border-bottom: solid 2px rgba(0,0,0,.25);">
            <div class="col-md-12">
                <h2><b>Message List</b></h2>
                <br/>

                <hr>
                <div class="table-responsive">
                    <table id="mytable" class="table table-condensed table-bordered">
                        <theads>
                            <tr>
                                <th class="col-md-3 text-center">Sender</th>
                                <th class="col-md-3 text-center">Message</th>
                            </tr>
                            </thead>
                            <tbody>
                                <g:each var="msg" in="${messages}">
                                    <tr>


                                        <td class="col-md-3 text-center">${msg.sender}</td>
                                        <td class="col-md-3 text-center">${msg.message}</td>
                                    </tr>
                                </g:each>
                            </tbody>      
                    </table>
                    <div class="clearfix"></div>
                </div> <!--end of div table-->
            </div> <!--end of column-->
        </div> <!--end of row-->
    </div> <!--end of container-->

<!-- ABOUT --><!-- ABOUT -->
    <g:render template="/layouts/about"/>
    <g:render template="/layouts/footer"/>



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


</body>
</html>