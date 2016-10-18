<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<section id="footer" class="hris-section">
    <div class="container" id="offset-top">
        <div class="row">
            <hr>
        </div>
        <div class="row">
            <small class="pull-right">Karaoke Avenue. Sing your feelings &copy; 2016</small>
            <small class="pull-left">
                <span class="glyphicon glyphicon-envelope"></span>
                <a href="http://plv.edu.ph/" target="_blank">Pamantasan ng Lungsod ng Valenzuela</a>
                <span>&nbsp;&bull;&nbsp;</span>
                <g:if test="${session.level}">
                    <a href="#" data-toggle="modal" data-target="#changeUserModal">Change password</a>
                </g:if>
            </small>
            <small class="pull-left">

            </small>
        </div>
    </div>
</section>
<g:if test="${session.level}">
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
                        <g:hiddenField name="id" value="${session['id']}"/>
                    </g:form>
                </div>
            </div>
            <div class="modal-footer">
                <button form="changeUser" type="submit" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span>Submit</button>
            </div>
        </div>
    </div>
</div>
</g:if>

