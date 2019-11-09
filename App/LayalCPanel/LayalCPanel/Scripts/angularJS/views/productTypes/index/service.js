ngApp.service('productTypesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/ProductTypes/' };



	//Methods
        getProductTypes(filter) {
            return h({
                url: `${this.basePath}getProductTypes?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save productType  
        saveChange(productType) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:productType
			});
		};



	};
	return new funcs();
}]);