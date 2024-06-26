<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=1.0">
    <title>代码预览</title>
    <#include  "*/commonHeader.ftl">
    <script src="js/jquery-3.6.1.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="highlight/default.min.css">
    <script src="highlight/highlight.min.js" type="text/javascript"></script>
    <script src="js/base64.min.js" type="text/javascript"></script>
    <script>hljs.highlightAll()</script>

    <style>
        div.code {
            white-space: pre;
        }
        ::-webkit-scrollbar-track {
            background-color: #F5F5F5;
        }
        ::-webkit-scrollbar {
            width: 6px;
            background-color: #F5F5F5;
        }
        ::-webkit-scrollbar-thumb {
            background-color: #999;
        }
        pre{overflow:hidden}
    </style>
</head>
<body>

<input hidden id="textData" value="${textData}"/>

<div class="container">
    <div class="panel panel-default">
        <div id="code" class='code'></div>
    </div>
</div>


<script>
    /**
     * 初始化
     */
    window.onload = function () {
        initWaterMark();
        loadText();
    }

    /**
     *加载普通文本
     */
    function loadText() {
        var base64data = $("#textData").val()
        var textData = Base64.decode(base64data);

        var textPreData = "<pre><code>" + textData + "</code></pre>";
        $("#code").append(textPreData);
        document.querySelectorAll('div.code').forEach(block => {
            // then highlight each
            hljs.highlightBlock(block);
        });
    }

</script>

</body>

</html>
