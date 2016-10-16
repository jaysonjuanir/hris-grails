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