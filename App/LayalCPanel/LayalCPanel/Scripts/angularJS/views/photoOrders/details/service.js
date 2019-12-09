ngApp.service('productsServ', ['$http', function (h) {

    class funcs {

        //Getter
        get basePath() { return '/PhotoOrders/' };



        //Methods
        getOrder(id) {
            return h({
                url: `${this.basePath}getOrderFullDetailsById?id=${id}`,
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



    };
    return new funcs();
}]);