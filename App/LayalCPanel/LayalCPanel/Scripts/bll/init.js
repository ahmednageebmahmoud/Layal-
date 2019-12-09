class initScripts {

     static  initTooltip  (el) {
         var skin = 'tooltip-dark';
        var width = el.data('width') == 'auto' ? 'tooltop-auto-width' : '';
        var triggerValue = el.data('trigger') ? el.data('trigger') : 'hover';
        var placement = el.data('placement') ? el.data('placement') : 'left';

        el.tooltip({
            trigger: triggerValue,
            template: '<div class="tooltip ' + skin + ' ' + width + '" role="tooltip">\
                <div class="arrow"></div>\
                <div class="tooltip-inner"></div>\
            </div>'
        });
    }

      initTooltips() {
        // init bootstrap tooltips
              document.querySelectorAll('[title]').forEach(elm => {
                  elm.setAttribute('data-skin', 'dark');
                  elm.setAttribute('data-toggle', 'kt-tooltip');
                  elm.setAttribute('data-placement', 'top');
                  initScripts.initTooltip($(elm));
              })
         
        }

    constructor() {
      //  this.initTooltips();
    }
}
 