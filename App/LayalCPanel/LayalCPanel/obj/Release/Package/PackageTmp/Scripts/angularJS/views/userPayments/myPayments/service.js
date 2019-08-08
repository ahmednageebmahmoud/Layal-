ngApp.service('paymentsInformationsServ', ['$http', function (h) {

	class funcs {

		//Getter
	    get basePath() { return '/UserPayments/' };



	//Methods
	    getUserPayments(skip, take) {
	        return h({
	            url: `${this.basePath}getUserPayments?skip=${skip}&take=${take}`,
	            method: 'get',
                
	        });
        };
         
	    

	};
	return new funcs();
}]);