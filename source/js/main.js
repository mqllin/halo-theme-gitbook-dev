// import $ from "jquery";
const $ = require("jquery");


console.log("pathname", window.location.pathname)
const pathName = window.location.pathname;
let activePath = ''
console.log('active', $('.menu-item'))

$('.menu-item').each((index, item) => {
    if (item.getAttribute('data-path') === pathName) {
        console.log(item.innerText, item.getAttribute('data-level'))
        const parentId = item.getAttribute('data-parentId')
        console.log(item.innerText + '=parentId', parentId)

        if (parentId !== 0) {
            $('.menu-item-children').each((i, ite) => {
                if (ite.getAttribute('data-childId') === parentId) {
                    console.log('parent', ite)
                    $(ite).addClass('children-show')
                }
                return;
            })
        }
        if (item.getAttribute('data-level') === '1') {

        }
        activePath = pathName;
        return $(item).addClass('active-menu-item')
    }
})

$('.menu-item-children').each((index, item) => {
    if (item.getAttribute('data-parentPath') === activePath) {
        return $(item).addClass('children-show')
    }
})

