<%@ page import="org.codehaus.groovy.grails.commons.GrailsClassUtils" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户管理-<g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'layout.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'menu.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'styles',file:'head.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'styles',file:'standard1.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir:'css',file:'mymenu.css')}" type="text/css">
    <script type="text/javascript" src='${resource(dir: 'js',file: 'jquery-1.4.2.js')}'></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'changeColor.js')}"></script>
    <g:layoutHead/>
    <r:layoutResources />
    %{--<script>
        $(document).ready(function(){
            $(".deviceCount").click(function(){
                $("#mainContainer").load("../deviceCount.jsp");
            })
        })
    </script>--}%
</head>
<body onload="blinkit()">
<div id="wrapper">
    <div id='titleContainerDiv'>
        <div id="titleDiv">港口起重机数据采集平台系统</div>
    </div>

     <div class="frontcontent"><g:layoutBody/></div>
    <g:javascript library="application"/>
    <r:layoutResources />
</div>
</body>
</html>
