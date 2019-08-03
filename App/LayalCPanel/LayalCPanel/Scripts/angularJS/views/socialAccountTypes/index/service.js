ngApp.service('socialAccountTypesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/SocialAccountTypes/' };



	//Methods
        getSocialAccountTypes(filter) {
            return h({
                url: `${this.basePath}getSocialAccountTypes?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save socialAccountType  
        saveChange(socialAccountType) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:socialAccountType
			});
		};



	};
	return new funcs();
}]);