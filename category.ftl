<#include "module/macro.ftl">
<@layout title="分类：${category.name} - ${blog_title!}">
    <div class="category-title">分类 ${category.name}下的文章</div>

    <div class="category-list">
        <#list posts.content as post>
            <a class="category-item" href="${post.fullPath}">
                <div class="icon"><svg viewBox="0 0 16 16" fill="none" preserveAspectRatio="xMidYMid meet" data-rnw-int-class="nearest__262-1645__" class="r-1rasi3h r-mabqd8 r-1vzi8xi r-1yvhtrz"><path d="M14.5 16h-13a.5.5 0 01-.5-.5V.5a.5.5 0 01.5-.5h13a.5.5 0 01.5.5v15a.5.5 0 01-.5.5zM2 15h12V1H2v14z" fill="currentColor"></path><path d="M13 2H3v1h10V2zM13 13H3v1h10v-1z" fill="currentColor"></path></svg></div>
                <div>${post.title}</div>
            </a>
        </#list>
    </div>

    <h1>分页</h1>

    <#if posts.totalPages gt 1>
        <ul>
            <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
                <#if pagination.hasPrev>
                    <li>
                        <a href="${pagination.prevPageFullPath!}">
                            上一页
                        </a>
                    </li>
                </#if>
                <#list pagination.rainbowPages as number>
                    <li>
                        <#if number.isCurrent>
                            <span class="current">第 ${number.page!} 页</span>
                        <#else>
                            <a href="${number.fullPath!}">第 ${number.page!} 页</a>
                        </#if>
                    </li>
                </#list>
                <#if pagination.hasNext>
                    <li>
                        <a href="${pagination.nextPageFullPath!}">
                            下一页
                        </a>
                    </li>
                </#if>
            </@paginationTag>
        </ul>
    <#else>
        <span>当前只有一页</span>
    </#if>
</@layout>
