ngApp.service('ordersServ', ['$http', function (h) {

	class funcs {

		//Getter
	    get basePath() { return '/Ordersphotographers/' };



	//Methods
        getOrders(filter) {
            return h({
                url: `${this.basePath}getMyOrders?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save order  
        saveChange(order) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:order
			});
		};



	};
	return new funcs();
}]);