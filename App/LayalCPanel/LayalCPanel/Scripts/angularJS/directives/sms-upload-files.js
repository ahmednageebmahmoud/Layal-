
ngApp.directive('smsUploadFiles', function ($compile) {
	return {
		restrict: 'E',
		replace: true,
		link: function ($scope, element, attrs) {

			element.html(
				`<input type="file" id="customFile" class="${attrs.ngSmsClass}" accept="${attrs.ngSmsAccept}" ${attrs.ngSmsFilesCount > 1 ? `multiple` : ``}  onchange="angular.element(this).scope().uplaodImages(this.files,${attrs.ngSmsData})"/>`);

			//الان نقوم نعطى امر للـ الانجلر لـ عمل كومبيل بشكل يدوى 
			$compile(element.contents())($scope)
	 
		},
	}
});
