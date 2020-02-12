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

     
        //save payment
        addNewPayment(payment) {
            let data = new FormData();

            data.append("Amount", payment.Amount);
            data.append("OrderId", payment.OrderId);
            data.append("File", payment.File);

            return h({
                url: `${this.basePath}AddPayment`,
                method: 'post',
                data: data,
                headers: { 'Content-Type': angular.undefined }
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