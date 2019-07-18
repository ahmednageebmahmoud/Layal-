ngApp.service('loginServ', ['$http', function (h) {
	class funcs {

		//Getter
        get basePath() { return '/Login/' };
	 
		//save loginInfo
        login(loginInfo) {

			return h({
				url: `${this.basePath}login`,
				method: 'post',
                data: loginInfo
			});
		};



	};
	return new funcs();
}]);