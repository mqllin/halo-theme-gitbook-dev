<#macro layout title>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
        <meta name="keywords" content="${meta_keywords!}"/>
        <meta name="description" content="${meta_description!}"/>
        <link rel="stylesheet" href="${theme_base!}/source/font/iconfont.css"/>

        <!-- inject:css -->
        <link rel="stylesheet" href="${theme_base!}/source/css/gitbook-main-1.0.min.css"/>
        <!-- endinject -->

        <#--
            公共 head 代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
            包含：Favicon，自定义 head 等
        -->

        <@global.head />

        <title>${title}</title>
    </head>
    <body>
    <#include "./header.ftl">

    <div class="content-view">
        <div class="pageMenu">
            <#include "./menu.ftl">
        </div>
        <div class="content-card">
            <#nested >
        </div>
    </div>
    <#--
        公共底部代码，详情请参考：https://docs.halo.run/zh/developer-guide/theme/public-template-tag
        包含：统计代码，底部信息
    -->
    <@global.footer />
    <!-- inject:js -->
    <script src="${theme_base!}/source/js/gitbook-main-1.0.min.js"></script>
    <!-- endinject -->

    </body>
    </html>
</#macro>

