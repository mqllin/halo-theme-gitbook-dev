#Halo-theme-gitbook-dev
halo博客gitbook主题开发版项目工程
请将本项目文件夹放到博客主题文件夹内。与其他主题文件同级
- 1.npm install 
- 本地开发：
- 2.gulp dev
- 项目打包
- 3.gulp build

项目启动gulp dev或build后会在Halo的博客主题文件夹内自动生成打包好的主题文件夹（../gitbook）
在Halo的主题设置里选择启用打包生成后的主题。

修改文件会及时生效（刷新页面后可见）
如果新增或删除了文件需要重新启动dev或build命令
如果是新增了目录，需要修改`gulpfile.js`文件，修改自动化打包流程。修改规则请参考gulp.js官网文档
