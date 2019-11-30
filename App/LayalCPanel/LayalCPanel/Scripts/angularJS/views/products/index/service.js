ngApp.service('productsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Products/' };



	//Methods
        getProducts(filter) {
            return h({
                url: `${this.basePath}getProducts?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

        changeActive(id, isActive) {
            return h({
                url: `${this.basePath}ProductDisactive?id=${id}&isActive=${isActive}`,
                method: 'get',
            });
        };

     

		//save product  
        saveChange(product) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:product
			});
		};



	};
	return new funcs();
}]);