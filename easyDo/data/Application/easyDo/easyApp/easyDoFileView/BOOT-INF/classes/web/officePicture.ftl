<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>PDF图片预览</title>
    <#include "*/commonHeader.ftl">
    <script src="js/lazyload.js"></script>
    <style>
        body {
            background-color: white;
        }
        .container {
            width: 100%;
            height: 100%;
        }
        .img-area {
            text-align: center;
        }
        .my-photo {
            max-width: 98%;
            margin:0 auto;
            border-radius:3px;
            box-shadow:rgba(0,0,0,0.15) 0 0 8px;
            background:#FBFBFB;
            border:1px solid #ddd;
            margin:10px auto;
            padding:5px;
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

    </style>
</head>
<body>
<div class="container">
    <#list imgUrls as img>
        <div class="img-area">
            <img class="my-photo" alt="loading"  data-src="${img}" src="images/loader.svg">
        </div>
    </#list>
</div>
<#if "false" == switchDisabled>
    <img src="images/pdf.svg" width="48" height="48" style="position: fixed; cursor: pointer; top: 40%; right: 48px; z-index: 999;" alt="使用PDF预览" title="使用PDF预览" onclick="changePreviewType('pdf')"/>
</#if>
<script>
    window.onload = function () {
        /*初始化水印*/
        initWaterMark();
        checkImgs();
    };
    window.onscroll = throttle(checkImgs);
    function changePreviewType(previewType) {
        var url = window.location.href;
        if (url.indexOf("officePreviewType=image") !== -1) {
            url = url.replace("officePreviewType=image", "officePreviewType="+previewType);
        } else {
            url = url + "&officePreviewType="+previewType;
        }
        if ('allImages' === previewType) {
            window.open(url)
        } else {
            window.location.href = url;
        }
    }
</script>
</body>
</html>
