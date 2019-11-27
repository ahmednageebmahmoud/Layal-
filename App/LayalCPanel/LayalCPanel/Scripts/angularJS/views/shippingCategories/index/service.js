ngApp.service('shippingCategoriesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/ShippingCategories/' };



	//Methods
        getItems(filter) {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };

        getCities(id) {
            return h({
                url: `${this.basePath}getCities?countyId=${id}`,
                method: 'get',
            });
        };
	    

		//save shippingCategory  
        saveChange(shippingCategory) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:shippingCategory
			});
		};



	};
	return new funcs();
}]);