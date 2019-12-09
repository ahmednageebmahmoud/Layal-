ngApp.service('ordersServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/PhotoOrders/' };



	//Methods
        getOrders(filter) {
            return h({
                url: `${this.basePath}getMyOrders?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     
        cancel(id) {
            return h({
                url: `${this.basePath}cancel?id=${id}`,
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