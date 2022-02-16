<#include "module/macro.ftl">
<#--代码高亮-->
<#--        <link rel="stylesheet" href="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.4.0/build/styles/default.min.css">-->
<#--<link rel="stylesheet" href="${theme_base!}/source/js/plugins/highlight/styles/androidstudio.css">-->
<link rel="stylesheet" href="${theme_base!}/source/js/plugins/highlight/styles/adocusaurus.css">


<@layout title="${post.title!} - ${blog_title!}">
    <p>
<#--        <span>分类名称 ${post.categories.name}</span>-->
    </p>
    <h1>${post.title!}22</h1>
        <span>分类名称 ${post}</span>

    <#if post.categories??>
      <#if post.categories[0] ??>
          has categories
          <div>分类=${post.categories[0].name!}</div>
      </#if>
    </#if>

    <article class="gitbook-markdown-body">
        ${post.formatContent!}
    </article>



    <div class="post-pagination-view">
        <#if prevPost??>
            <a class="post-pagination-item" href="${prevPost.fullPath!}">
                <div class="post-pagination-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" preserveAspectRatio="xMidYMid meet" data-rnw-int-class="nearest__262-1645__" class="r-1rasi3h r-1472mwg r-1vzi8xi r-lrsllp"><path d="M19 12H5M12 19l-7-7 7-7"></path></svg>
                </div>
                <div class="post-pagination-text">
                    <div>
                        <span>上一篇：</span>
                        <#if prevPost.categories??>
                            <#if prevPost.categories[0] ??>
                                <span> 分类=${prevPost.categories[0].name!}</span>
                            <#else>
                                <span>无分类</span>
                            </#if>
                            <#else>
                                <span>无分类</span>
                            </#if>
                    </div>
                    <div>${prevPost.title!}</div>
                </div>
            </a>
        <#else>
            <a class="post-pagination-item" href="#">
                <div class="post-pagination-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" preserveAspectRatio="xMidYMid meet" data-rnw-int-class="nearest__262-1645__" class="r-1rasi3h r-1472mwg r-1vzi8xi r-lrsllp"><path d="M19 12H5M12 19l-7-7 7-7"></path></svg>
                </div>
                <div class="post-pagination-text">上一篇：没有了</div>
            </a>
        </#if>

        <#if nextPost??>
            <a class="post-pagination-item" href="${nextPost.fullPath!}">
                <div class="post-pagination-text">
                    <div>
                        <span>下一篇：</span>
                        <#if nextPost.categories??>
                            <#if nextPost.categories[0] ??>
                                <span>${nextPost.categories[0].name!}</span>
                             <#else>
                                <span>无分类</span>
                            </#if>
                            <#else>
                            <span>无分类</span>
                        </#if>
                    </div>
                    <div>${nextPost.title!}</div>
                </div>
                <div class="post-pagination-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" preserveAspectRatio="xMidYMid meet" data-rnw-int-class="nearest__262-1645__" class="r-1rasi3h r-1472mwg r-lrsllp" style="vertical-align: middle;"><path d="M5 12h14M12 5l7 7-7 7"></path></svg>
                </div>
            </a>
        <#else>
            <a class="post-pagination-item" href="#">
                <div class="post-pagination-text">下一篇：没有了</div>
                <div class="post-pagination-icon">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" preserveAspectRatio="xMidYMid meet" data-rnw-int-class="nearest__262-1645__" class="r-1rasi3h r-1472mwg r-1vzi8xi r-lrsllp"><path d="M19 12H5M12 19l-7-7 7-7"></path></svg>
                </div>
            </a>
        </#if>
    </div>


    <#include "module/comment.ftl">
    <@comment post=post type="post" />
</@layout>


<#--    <script src="//cdn.jsdelivr.net/gh/highlightjs/cdn-release@11.4.0/build/highlight.min.js"></script>-->
<script src="${theme_base!}/source/js/plugins/highlight/highlight.min.js"></script>
<script>hljs.highlightAll();</script>

