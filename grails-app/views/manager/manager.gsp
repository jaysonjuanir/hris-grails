
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

    <body id="home">
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
            <div class="container" style="position: relative;top: 50%;width:100%">
                <div class="row">
                    <h2 class="text-center" style="width: 65%;margin-top: 0px;color: black;padding: 4% 4%;background-color: #fff;opacity: 0.7;">Welcome ${employee.name.toString()}</h2> 
                </div>

                <div class="row">

                    <div class="col five">			
                        <a style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-image"></i> 201 File</a>			
                    </div>

                    <div class="col five">
                        <a style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-pencil"></i> Payroll And Benefits</a>			
                    </div>

                    <div class="col five">
                        <a style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-shopping-cart"></i> Attendance</a>						
                    </div>

                    <div class="col five">
                        <a style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-times-circle"></i> Rules And Regulation</a>			
                    </div>
                    <div class="col five">			
                        <a style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-image"></i> Sanctions and Violations</a>			
                    </div>

                    <div class="col five">
                        <a style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-pencil"></i> Logout</a>			
                    </div>

                </div>
        </section>

        <div class="container"style="margin-top:3%;">
            <div class="row" style="background-color: #cac7c7;border-radius: 25px;border-bottom: solid 2px rgba(0,0,0,.25);">
                <div class="col-md-12">
                    <h2 style="float: left;margin: 2% 5%;"><b>EMPLOYEE LIST</b></h2>
                    <br/>
                    <g:link action="editEmployee" style="width: 20%;float: right;" class="btnn btn-concrete" role="button" >Edit Employee</g:link>
                        <hr>
                        <br/>
                        <div class="table-responsive">
                            <table id="mytable" class="table table-condensed table-bordered">
                                <thead>
                                    <tr>
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
                    <h2><b>MESSAGE LIST</b></h2>
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