ngApp.service('enquiresServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Enquires/' };


	//Methods

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };

	    getEnquiy(id) {
            return h({
                url: `${this.basePath}getEnquiy?id=${id}`,
                method: 'get',
            });
        };
 
		//save enquiy  
        saveChange(enquiy) {
			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:enquiy
			});
		};



	};
	return new funcs();
}]);