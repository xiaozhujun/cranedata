<!DOCTYPE html>
<html>
<head>
    <title>数据平台管理</title>
    <meta name="layout" content="user">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'simpleTree.css')}" type="text/css">
    <script type="text/javascript" src="${resource(dir: 'js', file: 'simpleTree.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js', file: 'preventGlink.js')}"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $.ajax({
                url: "/cranedata/scene/getFront",
                success: function(data){
                    $(data).appendTo($("#status")).attr("id","tree");
                    simpleTree($("#tree"));
                    $(".bullet").click(function(){
                        $("#templatebody").load($(this).attr("url"));
                    });
                }
            });
            $(".nav a").click(function(){
                return preventGlink(this);
            });
            $("#init1").load("/crane/crane");
//                $("#init2").load("/portcrane-cms/content");
            $(".message").click(function(){
                $(this).remove();
            });
        });
    </script>
</head>
<body>
<div id="status" role="complementary">
    <div class="frontemplatebody" id="templatebody"></div>
</div>
<g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>

</g:if>
<div id="body">
    %{--<div id="init1"></div>
    <div id="init2"></div>--}%
</div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt"/></div>

</body>
</html>
