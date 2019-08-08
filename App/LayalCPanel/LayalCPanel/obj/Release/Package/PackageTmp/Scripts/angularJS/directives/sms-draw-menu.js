var currentControler = getcurrentController();
ngApp.directive('smsDrawMenu', function ($compile) {
    return {
        restrict: 'E',
        replace: true,
        link: function ($scope, element, attrs) {
            $scope.$watch('menus', function () {
                if (!Array.isArray($scope.menus))
                    return;

                var menu = "";
                $scope.menus.forEach(men => {
                    menu += drawMenu(men);
                });
                element.replaceWith(menu.replace("\n", ""));
                $compile(element.contents())($scope)
            });
        },
    }
});



/**
 * هنا نقوم برسم جميع القوائم
 * @param {any} menus
 */
function drawMenu(menu, isSub) {

    let subMenus = [];
    if (Array.isArray(menu.SubMenus)) {
        menu.SubMenus.forEach(subMenu => subMenus.push(drawMenu(subMenu, true)));

    }
    var subMeusString = "";
    var cssClass = menu.SubMenus==null|| menu.SubMenus.length > 0 ? "kt-menu__item--parent" : "kt-menu__item--submenu";
    if (menu.SubMenus == null || menu.SubMenus.length > 0)
    subMeusString =  `<div class="kt-menu__submenu "><span class="kt-menu__arrow"></span> <ul class="kt-menu__subnav">${subMenus.join('')}</ul></div>`;


    var pureMenu = `<li class="kt-menu__item ${cssClass} ${getMenuActivClass(menu)}"
                        aria-haspopup="true" data-ktmenu-submenu-toggle="hover">
                        <a href="javascript:;" class="kt-menu__link kt-menu__toggle">
                          <span class="kt-menu__link-icon">
                              <i class="${menu.CssClass}"></i>
                          </span>
                           <span class="kt-menu__link-text">${menu.MenuName}</span>
                           <i class="kt-menu__ver-arrow la la-angle-right"></i>
                        </a>
                          ${subMeusString}
                        ${drawPages(menu.Pages)}
                    </li>
           `;
    return pureMenu;

}


/**
 * هذة الدالة لرسم الصفح
 * @param {any} pages
 */
function drawPages(menusPages) {
    if (!Array.isArray(menusPages))
        return;

    var pages = "";
    menusPages.forEach(pg => {
        pages += `
                 <li class="kt-menu__item " aria-haspopup="true">
                     <a href="${pg.Url}" class="kt-menu__link ">
                         <i class="kt-menu__link-bullet kt-menu__link-bullet--dot"><span></span></i>
                         <span class="kt-menu__link-text">${pg.PageName}</span>
                     </a>
                 </li>
        `;
    });

    return `
                 <div class="kt-menu__submenu">
                    <span class="kt-menu__arrow"></span>
                    <ul class="kt-menu__subnav">${pages}</ul>
                 </div>
            `;
}


/**
 * الحصول على كلاس الاكتيف اذا كانت المنيو مفتوحة
 * @param {any} menu
 */
function getMenuActivClass(menu) {

    var isOpen = menu.Pages.filter(b => ('/' + currentControler).includes(b.Url) || window.location.pathname == b.Url).length > 0;
    if (isOpen)
        return 'kt-menu__item--open';
    return "";
}

/**
 * الحصول على كلاس الاكتيف للصفح
 * @param {any} menu
 */
function getPageActivClass(menu) {

    if (window.location.pathname == url)
        return 'kt-menu__item--active';
    return "";
}
