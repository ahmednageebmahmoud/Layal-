ngApp.service('ordersServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/PhotoOrdersMangment/' };


     
                                                                                      
	//Methods
        getOrders(filter) {
            
            return h({
                url: `${this.basePath}GetOrders?take=${filter.take}&skip=${filter.skip}&productTypeId=${filter.productTypeId}&productId=${filter.productId}&userCreatedId=${filter.userCreatedId}&createDateFrom=${convertDateTimeToString(filter.createDateFrom)}&createDateTo=${convertDateTimeToString(filter.createDateTo)}&isActive=${filter.isActive}`,
                method: 'get',
            });
        };

        getProductsByProductTypeId(id) {
            return h({
                url: `${this.basePath}getProductsByProductTypeId?productTypeId=${id}`,
                method: 'get',
            });
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };
     
      
        //save payment
        addNewPayment(payment) {
             

            return h({
                url: `${this.basePath}AddPayment`,
                method: 'post',
                data: payment,
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