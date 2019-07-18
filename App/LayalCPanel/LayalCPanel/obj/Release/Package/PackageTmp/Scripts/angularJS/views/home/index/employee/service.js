ngApp.service('homeServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return 'Home/' };



	//Methods
    
        getItems() {
            return h({
                url: `${this.basePath}getEmployeeItems`,
                method: 'get',
            });
        };

	    

	};
	return new funcs();
}]);