ngApp.service('packagesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Packages/' };



	//Methods
        getPackages(filter) {
            return h({
                url: `${this.basePath}getPackages?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save package  
        saveChange(packag) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:packag
			});
		};



	};
	return new funcs();
}]);