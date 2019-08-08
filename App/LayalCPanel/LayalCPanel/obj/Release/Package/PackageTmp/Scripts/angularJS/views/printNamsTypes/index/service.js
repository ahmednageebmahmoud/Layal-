ngApp.service('printNamesTypesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/PrintNamesTypes/' };



	//Methods
        getPrintNamesTypes(filter) {
            return h({
                url: `${this.basePath}getPrintNamesTypes?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save printNamesType  
        saveChange(printNamesType) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:printNamesType
			});
		};



	};
	return new funcs();
}]);