
ngApp.directive('title', function () {
    return {
        restrict: 'A',
        replace: true,
        
        link: function ($scope, element, attrs) {
                element.attr('data-skin', 'dark');
            element.attr('data-toggle', 'kt-tooltip');
            element.attr('data-placement' , 'top');
        },
    }
});
