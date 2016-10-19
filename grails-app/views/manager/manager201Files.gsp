<!DOCTYPE html>
<html>
    <head>
        <title>Bulletin - Karaoke Avenue</title>
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
                        <h2><b>201 FILES</b></h2>
                        <!-- container -->
                        <g:render template="/layouts/employeeView"/>
                        
                    </div> <!--end of column-->
                </div> <!--end of row-->

            </div> <!--end of container-->
        </section>
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