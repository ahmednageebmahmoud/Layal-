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

        //Cancle Request Decision
        cancleRequestDecision(cancleRequestDecision) {
            let data = new FormData();

            data.append("Id", cancleRequestDecision.Id);
            data.append("Customer_ReasonCanceling", cancleRequestDecision.Customer_ReasonCanceling);
            data.append("Customer_IsAccepted", cancleRequestDecision.Customer_IsAccepted);
            data.append("Customer_BankAccountNumber", cancleRequestDecision.Customer_BankAccountNumber);
            data.append("Customer_BankName", cancleRequestDecision.Customer_BankName);
            data.append("Customer_BankAccountName", cancleRequestDecision.Customer_BankAccountName);
            data.append("TransfaerAmpuntImageFile", cancleRequestDecision.TransfaerAmpuntImageFile);

            return h({
                url: `${this.basePath}cancleRequestDecision`,
                method: 'post',
                data: data,
                headers: { 'Content-Type': angular.undefined }
            });
        };



    };
    return new funcs();
}]);