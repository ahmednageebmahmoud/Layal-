ngApp.directive('upFiles', function ($compile) {
    return {
        restrict: 'E',
        replace: true,
        link: function ($scope, element, attrs) {
            element.html(`<button type="button" class="btn btn-outline-brand" onclick="document.getElementById('customFile').click()">
                                        <i class ="fa fa-upload"></i> ${attrs.text}
                                    </button>
                                        <input type="file" class ="custom-file-input" id="customFile" name="images" accept="${attrs.accept}"  ${attrs.count > 1 ? `multiple`: ``}  hidden
                                        onchange="angular.element(this).scope().uplaodImages(this.files);this.value=null"/>
                `);

            //الان نقوم نعطى امر للـ الانجلر لـ عمل كومبيل بشكل يدوى 
            $compile(element.contents())($scope)
        },
    }
});