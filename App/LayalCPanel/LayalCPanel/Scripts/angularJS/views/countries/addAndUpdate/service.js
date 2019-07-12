ngApp.service('addAUpdateCountriesServ', ['$http', function (h) {

	class funcs {
		//Getter
		get basePath() { return '/Countries/' };



	//Methods
		//get Country By Id
		getCountryById(countryId) {
			return h({
			    url: `${this.basePath}getCountryById?countryId=${countryId}`,
				method: 'get',
			});
		};

		

		//save country  
        saveChangeCountry(country) {

            return h({
				url: `${this.basePath}SaveChange`,
				method: 'post',
				data:country
			});
		};
		//saveChangeItem
		saveChangeCity(countryItem) {
			return h({
				url: `${this.basePath}SaveChangeCity`,
				method: 'post',
				data: countryItem
			});
		};


		
	};
	return new funcs();
}]);