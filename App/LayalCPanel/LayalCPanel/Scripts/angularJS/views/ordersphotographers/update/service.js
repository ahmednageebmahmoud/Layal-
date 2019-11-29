ngApp.service('productsServ', ['$http', function (h) {

    class funcs {

        //Getter
        get basePath() { return '/Ordersphotographers/' };



        //Methods
        getOrder(id) {
            return h({
                url: `${this.basePath}getOrderById?id=${id}`,
                method: 'get',
            });
        };

        getCities(id) {
            return h({
                url: `${this.basePath}getCities?countryId=${id}`,
                method: 'get',
            });
        };

        //Get Items
        getItems() {
            return h({
                url: `${this.basePath}getItems`,
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
                url: `${this.basePath}AddPaymentByClinet`,
                method: 'post',
                data: data,
                headers: { 'Content-Type': angular.undefined }
            });
        };



    };
    return new funcs();
}]);