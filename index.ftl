<#include "module/macro.ftl">
<link rel="stylesheet" href="${theme_base!}/source/js/plugins/swiper/swiper-bundle.min.css"/>
<script src="${theme_base!}/source/js/plugins/swiper/swiper-bundle.min.js"></script>

<@layout title="${blog_title!}">
    <h1>推荐</h1>
    <p>
        ${settings.index_notice!}
    </p>
    <@postTag method="listByTagId" tagId='2'>
           <h1>标签post</h1>
    </@postTag>

<#--    <@postTag method="listByTagSlug" tagSlug="swiper">-->
<#--       <h1>标签post</h1>-->
<#--    </@postTag>-->

    <div class="swiper mySwiper">
        <div class="swiper-wrapper">
<#--            <@postTag method="listByTagId" tagId="swiper">-->
<#--                <#list posts as post>-->
<#--                    <div class="swiper-slide">${post.title!}</div>-->
<#--                    <a href="${post.fullPath!}" class="swiper-slide">-->
<#--                        <img src="${post.thumbnail!}" alt="">-->
<#--                        ${post.title!}-->
<#--                    </a>-->
<#--                </#list>-->
<#--            </@postTag>-->
        </div>
<#--        <div class="swiper-button-next"></div>-->
<#--        <div class="swiper-button-prev"></div>-->
<#--        <div class="swiper-pagination"></div>-->
    </div>

    <script>
        var swiper = new Swiper(".mySwiper", {
            spaceBetween: 30,
            centeredSlides: true,
            autoplay: {
                delay: 2500,
                disableOnInteraction: false,
            },
            pagination: {
                el: ".swiper-pagination",
                clickable: true,
            },
            navigation: {
                nextEl: ".swiper-button-next",
                prevEl: ".swiper-button-prev",
            },
        });
    </script>

    <h1>文章列表</h1>
    <ul>
        <#list posts.content as post>
            <li>
                <a href="${post.fullPath!}">${post.title}</a>
            </li>
        </#list>
    </ul>
    <h1>分页</h1>
    <#if posts.totalPages gt 1>
        <div class="pagination-view">
            <@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
                <#if pagination.hasPrev>
                    <a class="pagination-item" href="${pagination.prevPageFullPath!}">
                        <span class="pagination-icon">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" preserveAspectRatio="xMidYMid meet" data-rnw-int-class="nearest__262-1645__" class="r-1rasi3h r-1472mwg r-1vzi8xi r-lrsllp"><path d="M19 12H5M12 19l-7-7 7-7"></path></svg>
                        </span>
                        <span>上一页</span>
                    </a>
                </#if>
<#--                <#list pagination.rainbowPages as number>-->
<#--                    <div>-->
<#--                        <#if number.isCurrent>-->
<#--                            <span class="current">第 ${number.page!} 页</span>-->
<#--                        <#else>-->
<#--                            <a href="${number.fullPath!}">第 ${number.page!} 页</a>-->
<#--                        </#if>-->
<#--                    </div>-->
<#--                </#list>-->
                <#if pagination.hasNext>
                    <a class="pagination-item" href="${pagination.nextPageFullPath!}">
                        <span>下一页</span>
                        <span class="pagination-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" preserveAspectRatio="xMidYMid meet" data-rnw-int-class="nearest__262-1645__" class="r-1rasi3h r-1472mwg r-lrsllp" style="vertical-align: middle;"><path d="M5 12h14M12 5l7 7-7 7"></path></svg>
                        </span>
                    </a>
                </#if>
            </@paginationTag>
        </div>
    <#else>
<#--        <span>当前只有一页</span>-->
    </#if>
</@layout>

