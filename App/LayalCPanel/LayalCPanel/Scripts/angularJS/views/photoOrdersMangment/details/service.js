ngApp.service('productsServ', ['$http', function (h) {

    class funcs {

        //Getter
        get basePath() { return '/PhotoOrdersMangment/' };



        //Methods
        getOrder(id) {
            return h({
                url: `${this.basePath}getOrderFullDetailsById?id=${id}`,
                method: 'get',
            });
        };

    
      
      

        //save payment
        acceptTransfare(payment) {
            return h({
                url: `${this.basePath}acceptTransfare`,
                method: 'post',
                data: payment
            });
        };



    };
    return new funcs();
}]);