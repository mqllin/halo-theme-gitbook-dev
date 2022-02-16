// gulp-plugins
const gulp = require("gulp");
const {series, parallel} = require("gulp");
const rename = require("gulp-rename");
const clean = require("gulp-clean");
const inject = require("gulp-inject");
const babel = require("gulp-babel");
const browserify = require("gulp-browserify");
const less = require("gulp-less");
const LessAutoprefix = require("less-plugin-autoprefix");
const autoprefix = new LessAutoprefix({browsers: ["last 2 versions"]});
const csso = require("gulp-csso");
const uglify = require("gulp-uglify");
const watch = require("gulp-watch");
const connect = require('gulp-connect');//自动刷新网页
const start = require('gulp-start');
const yaml = require('node-yaml');

// 发版配置文件
let config = require("./release-config");

// 基础路径
const SRC_LESS = "./source/less/main.less";
const SRC_JS = "./source/js/main.js";
const BUILD_ROOT = `../${config.theme_name}`;
const DIST_CSS = BUILD_ROOT + "/source/css";
const DIST_CSS_NAME = `${config.theme_name}-main-${config.release_version}.min.css`
const DIST_JS = BUILD_ROOT + "/source/js";
const DIST_JS_NAME = `${config.theme_name}-main-${config.release_version}.min.js`
const DIST_IMG = BUILD_ROOT + "/source/images";
const DIST_FONT = BUILD_ROOT + "/source/font";
const DIST_JS_PLUGINS = BUILD_ROOT + "/source/js/plugins";

// 环境
let env = 'prod';

/**
 * 清除打包目录历史文件
 * @param {*} cb
 */
function cleanDir(cb) {
    return gulp.src(BUILD_ROOT, {read: false}).pipe(clean({force: true}));
    cb();
}

function cleanFtl(cb) {
    console.log('`${BUILD_ROOT}/*.ftl`', `${BUILD_ROOT}/*.ftl`)
    return gulp.src([`${BUILD_ROOT}/*.ftl`, `${BUILD_ROOT}/module`]).pipe(clean({force: true}));
    if (cb) {
        cb();
    }
}

function cleanYaml(cb) {
    return gulp.src([`${BUILD_ROOT}/*.yaml`]).pipe(clean({force: true}));
    if (cb) {
        cb();
    }
}

/**
 * less编译压缩css
 * @param {*} cb
 */
function build_css(cb) {
    if (env === 'prod') {
        return gulp
            .src(SRC_LESS)
            .pipe(
                less({
                    plugins: [autoprefix]
                })
            )
            .pipe(csso())
            .pipe(
                rename({
                    prefix: config.theme_name + "-",
                    basename: `main-${config.release_version}`,
                    suffix: ".min",
                    extname: `.css`
                })
            )
            .pipe(gulp.dest(DIST_CSS));
    } else if (env === 'dev') {
        return gulp
            .src(SRC_LESS)
            .pipe(
                less({
                    plugins: [autoprefix]
                })
            )
            .pipe(
                rename({
                    prefix: config.theme_name + "-",
                    basename: `main-${config.release_version}`,
                    suffix: ".min",
                    extname: `.css`
                })
            )
            .pipe(gulp.dest(DIST_CSS));
    }
    cb();
}

/**
 * js压缩混淆
 * @param {*} cb
 */
function build_js(cb) {
    let must = gulp
        .src(SRC_JS)
        .pipe(babel())
        .pipe(browserify({transform: ["babelify"]}))
        .pipe(
            rename({
                prefix: config.theme_name + "-",
                basename: `main-${config.release_version}`,
                suffix: ".min",
                extname: ".js"
            })
        );
    if (env === "dev") {
        return must.pipe(gulp.dest(DIST_JS));
    } else {
        return must.pipe(uglify()).pipe(gulp.dest(DIST_JS));
    }
    cb();
}

/**
 * 动态注入css与js
 * @param {*} cb
 */
function inject_content(cb) {
    var target = gulp.src("./module/macro.ftl");
    var css_sources = gulp.src([`${BUILD_ROOT}/source/css/${DIST_CSS_NAME}`]);
    var js_sources = gulp.src([`${BUILD_ROOT}/source/js/${DIST_JS_NAME}`]);

    return target
        .pipe(
            inject(css_sources, {
                starttag: "<!-- inject:css -->",
                transform: function () {
                    return '<link rel="stylesheet" href="${theme_base!}/source/css/' + DIST_CSS_NAME + '"/>';
                }
            })
        )
        .pipe(gulp.dest(BUILD_ROOT))
        .pipe(
            inject(js_sources, {
                starttag: "<!-- inject:js -->",
                transform: function (filePath) {
                    return '<script src="${theme_base!}/source/js/' + DIST_JS_NAME + '"></script>';
                }
            })
        )
        .pipe(gulp.dest(BUILD_ROOT + '/module/'))
    if (cb) {
        cb();
    }
}

/**
 * 复制其余php文件到dist，排除footer.php和header.php
 * @param {*} cb
 */
function copy_template(cb) {
    gulp
        .src(['./module/*.ftl'])
        .pipe(gulp.dest(BUILD_ROOT + '/module/'), {overwrite: true});
    return gulp
        .src(['!./module/*.ftl', "./*.ftl", "./*.yaml"])
        .pipe(gulp.dest(BUILD_ROOT), {overwrite: true});
    if (cb) {
        cb();
    }
}

/**
 * 复制img文件夹到dist
 * @param {s} cb
 */
function copy_img(cb) {
    return gulp.src(["./source/images/**"]).pipe(gulp.dest(DIST_IMG));
    cb();
}

/**
 * 复制font文件夹到jsPlugins
 * @param {s} cb
 */
function copy_jsPlugins(cb) {
    return gulp.src(["./source/js/plugins/**"]).pipe(gulp.dest(DIST_JS_PLUGINS));
    cb();
}

/**
 * 复制font文件夹到dist
 * @param {s} cb
 */
function copy_font(cb) {
    return gulp.src(["./source/font/*"]).pipe(gulp.dest(DIST_FONT));
    cb();
}

async function updateYaml(cb) {
    const yamlFile = `../${config.theme_name}/theme.yaml`
    console.log(`yamlFile` + yamlFile);
    const data = await yaml.read(yamlFile);

    const res = JSON.parse(JSON.stringify(data));
    console.log('res id===>' + res.id)
    res.id = config.theme_name
    res.name = config.theme_name
    yaml.write(yamlFile, res);
    if (cb) {
        cb();
    }
}

async function finishTask(cb) {
    console.log(`📦编译完成` + new Date().getTime());
    connect.reload();
    if (cb) {
        cb();
    }
}

/**
 * dev
 * @param {*} cb
 */
function dev(cb) {
    env = 'dev';
    connect.server({
        livereload: true,
    })

    watch("./module/*.ftl",).on('change', (change) => {
        console.log('change', change)
        inject_content()
        gulp
            .src(change)
            .pipe(gulp.dest(BUILD_ROOT + "/module/"), {overflow: true})
            .pipe(connect.reload())
    });
    watch("./*.ftl",).on('change', (change) => {
        console.log('change', change)
        inject_content()
        gulp
            .src(change)
            .pipe(gulp.dest(BUILD_ROOT + "/"), {overflow: true})
            .pipe(connect.reload())
    });
    watch("./*.yaml", () => {
        console.log('change yaml' + new Date().getMilliseconds())
        cleanYaml()
        updateYaml()
        finishTask()
    });

    watch("./source/less/**/*.less", () => {
        console.log('change css' + new Date().getMilliseconds())
        build_css();
    });
    watch("./source/js/**/*.js", () => {
        console.log('change js' + new Date().getMilliseconds())
        build_js();
    });
    cb();
}

/**
 * build
 * @param {*} cb
 */
function build(cb) {
    env = 'prod';
    cb();
}

const build_task = series(
    build,
    cleanDir,
    parallel(build_css, build_js),
    inject_content,
    copy_template,
    copy_img,
    copy_font,
    copy_jsPlugins,
    updateYaml,
    finishTask
);
const dev_task = series(
    dev,
    build_task
)

exports.dev = dev_task
exports.build = build_task;

exports.update = series(
    cleanFtl,
    inject_content,
    copy_template,
    finishTask
)
