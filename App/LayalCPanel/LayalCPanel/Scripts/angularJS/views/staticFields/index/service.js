ngApp.service('staticFieldsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/StaticFields/' };



	//Methods
        getStaticFields(filter) {
            return h({
                url: `${this.basePath}getStaticFields?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save staticField  
        saveChange(staticField) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:staticField
			});
		};



	};
	return new funcs();
}]);