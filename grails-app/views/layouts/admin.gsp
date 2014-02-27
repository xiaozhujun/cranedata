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
    <title>数据平台-<g:layoutTitle default="Grails"/></title>
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
    <g:layoutHead/>
    <r:layoutResources />
</head>
<body>
<div id="wrapper">
    <div id='titleContainerDiv'>
        <div id="titleDiv">港口起重机数据采集平台系统<span id="devNameDiv"></span></div>
    </div>
    <div id="container">
        <div id="menuContainer">
            <div class="menuFunc">
                <div class="menuFuncName"><p>现场记录管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem"><span id="d1"><g:link url="[action:'create',controller: 'scene']">添加现场记录</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'list',controller:'scene']">现场记录查询</g:link></span></div>

                </div>
            </div>
            <div class="menuFunc">
                <div class="menuFuncName"><p>设备管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem" ><span id="d1"><g:link url="[action:'create',controller:'device']">添加设备</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'list',controller:'device']">设备查询</g:link></span></div>
                </div>
            </div>
            <div class="menuFunc">
                <div class="menuFuncName"><p>传感器管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem"><span id="d1"><g:link url="[action:'create',controller:'sensor']">添加传感器</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'list',controller:'sensor']">传感器查询</g:link></span></div>
                </div>
            </div>
            <div class="menuFunc">
                <div class="menuFuncName"><p>通道管理</p></div>
                <div class="menuItemList">
                    <div class="menuItem"><span id="d1"><g:link url="[action:'create',controller:'channel']">添加通道</g:link></span></div>
                    <div class="menuItem"><span id="d1"><g:link url="[action:'list',controller:'channel']">通道查询</g:link></span></div>
                </div>
            </div>
        </div>
        <div id="mainContainer"><g:layoutBody/></div>
    </div>

    <div class="footer" role="contentinfo"></div>
    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
    <g:javascript library="application"/>
    <r:layoutResources />
</div>
</body>
</html>
