ngApp.service('paymentsInformationsServ', ['$http', function (h) {

	class funcs {

		//Getter
	    get basePath() { return '/EnquiryPayments/' };



	//Methods
        getPaymentsInformations(enquiryId) {
            return h({
                url: `${this.basePath}getPaymentsInformations?enquiryId=${enquiryId}`,
                method: 'get',
                
            });
        };
        
        		//save paymentsInformation  
        saveChange(payment) {

            return h({
                url: `${this.basePath}saveChange`,
                method: 'post',
                data: payment
            });
        };


		//save paymentsInformation  
        acceptFromManger(payment) {

			return h({
			    url: `${this.basePath}acceptFromManger`,
			    method: 'post',
			    data: payment
			});
		};

        
	    

	};
	return new funcs();
}]);