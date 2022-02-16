<div class="menu-view">
    <@menuTag method="list">
        <ul>
            <#list menus?sort_by('priority') as menu>
                <li>
                    <a class="menu-item" data-path="${menu.url!}" href="${menu.url}"
                       target="${menu.target!}">${menu.name} </a>
                </li>
            </#list>
        </ul>
    </@menuTag>
    <@categoryTag method="tree">
        <ul>
            <#list categories as category>
                <li>
                    <a class="menu-item" data-id="${category.id!}" data-parentId="${category.parentId!}"
                       data-path="${category.fullPath!}"
                       href="${category.fullPath!}"
                       target="${category.target!}">${category.name!}</a>
                    <#if category.children?? && category.children?size gt 0>
                        <i class="icon iconfont icon-arrow"></i>
                    </#if>
                </li>
                <#if category.children?? && category.children?size gt 0>
                    <ul class="menu-item-children" data-childId="${category.id!}"
                        data-parentPath="${category.fullPath!}">
                        <#list category.children as child>
                            <script>
                                console.log('json', JSON.stringify('${category!}'))
                            </script>
                            <li>
                                <a class="menu-item" data-id="${child.id!}" data-parentId="${child.parentId!}"
                                   data-path="${child.fullPath!}"
                                   href="${child.fullPath!}"
                                   target="${category.target!}">${child.name!}</a>
                            </li>
                        </#list>
                    </ul>
                </#if>
            </#list>
        </ul>
    </@categoryTag>

    <#--    <@categoryTag method="list">-->
    <#--        <#list categories as category>-->
    <#--            <a href="${category.fullPath!}">${category.name!}（${category.postCount!}）</a>-->
    <#--        </#list>-->
    <#--    </@categoryTag>-->
</div>
