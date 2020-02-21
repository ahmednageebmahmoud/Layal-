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

        //cancle Request Payment Image
        cancleRequestPaymentImage(cancleRequestDecision) {
            let data = new FormData();

            data.append("Id", cancleRequestDecision.Id);
            data.append("TransfaerAmpuntImageFile", cancleRequestDecision.TransfaerAmpuntImageFile);

            return h({
                url: `${this.basePath}cancleRequestPaymentImage`,
                method: 'post',
                data: data,
                headers: { 'Content-Type': angular.undefined }
            });
        };

        
    };
    return new funcs();
}]);