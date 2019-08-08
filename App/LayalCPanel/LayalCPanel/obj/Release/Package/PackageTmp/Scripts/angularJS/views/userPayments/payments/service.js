ngApp.service('paymentsInformationsServ', ['$http', function (h) {

	class funcs {

		//Getter
	    get basePath() { return '/UserPayments/' };



	//Methods
	    getUserPayments(userToId,skip, take) {
	        return h({
	            url: `${this.basePath}getUserPayments?userToId=${userToId}&skip=${skip}&take=${take}`,
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
	    

	};
	return new funcs();
}]);