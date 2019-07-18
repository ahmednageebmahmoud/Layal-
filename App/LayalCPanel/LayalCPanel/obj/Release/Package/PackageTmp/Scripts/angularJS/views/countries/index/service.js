ngApp.service('countriesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Countries/' };



	//Methods
        getCountries(filter) {
            return h({
                url: `${this.basePath}getCountries?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save country  
        saveChange(country) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:country
			});
		};



	};
	return new funcs();
}]);