ngApp.service('packageInputTypesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/PackageInputTypes/' };



	//Methods
        getPackageInputTypes(filter) {
            return h({
                url: `${this.basePath}getPackageInputTypes?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save packageInputType  
        saveChange(packageInputType) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:packageInputType
			});
		};



	};
	return new funcs();
}]);