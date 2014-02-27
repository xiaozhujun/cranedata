<%@ page import="cranedata.Device" %>
<!DOCTYPE html>
<script type="text/javascript">
    $(document).ready(function(){
        $("#show-content a").click(function(){
            return preventGlink(this);
        });
    });
    function getId(id){
        var x="itemicon"+id;
        var y="showchannel"+id;
        var content=$("#"+x).val();
        if(content=="展开"){
            $("#"+x).val("收起");
        }else if(content=="收起"){
            $("#"+x).val("展开");
        }
        $("#"+y).toggle();
        $.ajax({
            type:"POST",
            url:"/cranedata/channel/getChannel",
            data:{id:id},
            success:function(data){
                $("#"+y).html(data);
            },
            error:function(data){

            }

        });
    };
</script>
<html>
<head>
    <g:set var="entityName" value="${message(code: 'device.label', default: 'Device')}" />
    <title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<a href="#show-device" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
%{--<div id="show-device" class="content scaffold-show" role="main">--}%
    <div class="devicetop"><span class="topfont">
    <g:fieldValue bean="${deviceInstance}" field="name"/>
    </span></div>
    <div class="devicebody">
        <div class="tabletitle">
            <span class="titleitem"><g:message code="device.channels.label" default="Scene" /></span>
            <span class="titleitem"><g:message code="device.channels.flag" default="Scene" /></span>
            <span class="titleitem">操作</span>
        </div>
        <div class="tablebody">
        <g:each in="${flist}" status="i" var="deviceInstance">
            <div class="ban">
            <div class="bodyitem">
                <span class="hide" id="hide">${fieldValue(bean: deviceInstance, field: "id")}</span>
                <span class="titleitem"><span class="itemfont">${fieldValue(bean: deviceInstance, field: "name")}</span><input type="button" value="展开" onclick="getId('${fieldValue(bean: deviceInstance, field: "id")}')" class="itemicon" id="itemicon${fieldValue(bean: deviceInstance, field: "id")}"></span></span>
                <span class="titleitem"><g:if test="${(fieldValue(bean: deviceInstance, field: 'flag').equals('[0]'))}">
                    <span class="btn1">未连接</span>
                </g:if>
                    <g:if test="${(fieldValue(bean: deviceInstance, field: 'flag').equals('[1]'))}">
                        <span class="btn">已连接</span>
                    </g:if></span>
                <span class="titleitem"><g:if test="${(fieldValue(bean: deviceInstance, field: 'flag').equals('[0]'))}">
                    <span class="btnbu">连接</span>
                </g:if>
                    <g:if test="${(fieldValue(bean: deviceInstance, field: 'flag').equals('[1]'))}">
                        <span class="btnbu">断开</span>
                    </g:if></span>
            </div>
                <div class="showchannel" id="showchannel${fieldValue(bean: deviceInstance, field: "id")}" >
                </div>
            </div>
        </g:each>
        </div>



       %{--     <table class="devicetable">
                <thead>
                <tr>
                    <th><g:message code="device.channels.label" default="Scene" /></th>

                    <th><g:message code="device.channels.flag" default="Scene" /></th>

                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
               --}%%{-- <g:each in="${deviceInstanceList}" status="i" var="deviceInstance">--}%%{--
                <g:each in="${flist}" status="i" var="deviceInstance">
                    <tr >
                        <td>${fieldValue(bean: deviceInstance, field: "name")}</td>
                        --}%%{--<td>${fieldValue(bean: deviceInstance, field: "flag")}</td>--}%%{--
                        <td>
                         <g:if test="${(fieldValue(bean: deviceInstance, field: 'flag').equals('[0]'))}">
                        <span class="btn1">未连接</span>
                          </g:if>
                        <g:if test="${(fieldValue(bean: deviceInstance, field: 'flag').equals('[1]'))}">
                            <span class="btn">已连接</span>
                        </g:if>
                        </td>
                         <td>
                    <g:if test="${(fieldValue(bean: deviceInstance, field: 'flag').equals('[0]'))}">
                        <span class="btnbu">连接</span>
                        </g:if>
                    <g:if test="${(fieldValue(bean: deviceInstance, field: 'flag').equals('[1]'))}">
                        <span class="btnbu">断开</span>
                    </g:if>
                        </td>
                   </tr>
                </g:each>
                </tbody>
            </table>--}%
</div>
</body>
</html>
