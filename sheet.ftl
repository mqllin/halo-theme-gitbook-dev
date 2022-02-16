<#--自定义页面-->
<#include "module/macro.ftl">
<link rel="stylesheet" href="${theme_base!}/source/js/plugins/highlight/styles/adocusaurus.css">

<@layout title="${sheet.title!} - ${blog_title!}">
    <h1>${sheet.title!}</h1>
    <article class="gitbook-markdown-body">
        ${sheet.formatContent!}
    </article>
    <#include "module/comment.ftl">
    <@comment post=sheet type="sheet" />
</@layout>
<script src="${theme_base!}/source/js/plugins/highlight/highlight.min.js"></script>
<script>hljs.highlightAll();</script>
