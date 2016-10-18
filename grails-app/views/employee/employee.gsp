
<!DOCTYPE html>
<html>
    <head>
        <title>${employee.name} - Karaoke Avenue</title>
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
        <link href="/hris/images/faviconn.ico" rel="shortcut icon" type="image/x-icon"></link>
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
        <section id="home" class="header hris-section" style="background-image : url('${resource(dir: 'images', file: 'hr-group.png')}')">
            <g:each var="err" in="${errors}" >
                <div class="column column-6"><h4 style="color:red">${err}</h4></div>
                </g:each>

            <div class="container" style="position: relative;top: 50%;width:100%">
                <div class="row">
                    <h2 class="text-center" style="width: 65%;margin-top: 0px;color: black;padding: 4% 4%;background-color: #fff;opacity: 0.7;">Welcome ${employee.name.toString()}</h2> 
                </div>

                <div class="row">

                    <div class="col five">			
                        <g:link action="download" params="[title: employee.id+'.docx', path: 'uploads/payroll']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-pencil"></i> View Profile</g:link>			
                    </div>

                    <div class="col five">
                        <g:link action="download" params="[title: employee.id+'.docx', path: 'uploads/tor']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-pencil"></i> View Education Record</g:link>			
                        </div>

                    <div class="col five">
                        <g:link action="download" params="[title: employee.id+'.docx', path: 'uploads/performanceAssessment']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-shopping-cart"></i> Performance Assessment</g:link>						
                        </div>

                    <div class="col five">
                        <g:link action="download" params="[title: employee.id+'.docx', path: 'uploads/correctiveActions']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-times-circle"></i> Sanctions and Violation</g:link>			
                        </div>
                        <div class="col five">			
                        <g:link action="download" params="[title: employee.id+'.docx', path: 'uploads/jobDescription']" style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete"><i class="fa fa-image"></i> Job Description</g:link>			
                        </div>

                    <div class="col five">
                        <a style="padding: 1.5em 1.5em;" href="#" class="btnn btn-concrete" data-toggle="modal" data-target="#loginModal"><i class="fa fa-pencil"></i> Logout</a>			
                    </div>
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
                                            <g:textArea rows="8" cols="40" name = "message" value = "" class="form-control" placeholder="Message *" required="required" data-error="Message is required." style="resize:none;"/>
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
                    <small class="pull-right">Karaoke Avenue. Sing your feelings © 2016</small>
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