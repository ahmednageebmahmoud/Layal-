
ngApp.directive('alertInfo', function ($compile) {
    return {
        restrict: 'E',
        replace: true,
        link: function ($scope, element, attrs) {

            if(attrs.isText)
            element.html(`<br /><br /><div class="alert alert-info" role="alert"><div class="alert-icon"><i class="flaticon-questions-circular-button"></i></div><div class ="alert-text">${attrs.model}</div></div>`);
            else
            element.html(`<br /><br /><div class="alert alert-info" role="alert"><div class="alert-icon"><i class="flaticon-questions-circular-button"></i></div><div class ="alert-text">{{${attrs.model}}}</div></div>`);

            //الان نقوم نعطى امر للـ الانجلر لـ عمل كومبيل بشكل يدوى 
            $compile(element.contents())($scope)

        },
    }
});



ngApp.directive('alertError', function ($compile) {
    return {
        restrict: 'E',
        replace: true,
        link: function ($scope, element, attrs) {

            if (attrs.isText)
                element.html(`<div class="alert alert-danger" role="alert"><div class="alert-icon"><i class="flaticon-warning"></i></div><div class ="alert-text">${attrs.model}</div></div>`);
            else
                element.html(`<div class="alert alert-danger" role="alert"><div class="alert-icon"><i class="flaticon-warning"></i></div><div class ="alert-text">{{${attrs.model}}}</div></div>`);

            //الان نقوم نعطى امر للـ الانجلر لـ عمل كومبيل بشكل يدوى 
            $compile(element.contents())($scope)

        },
    }
});
