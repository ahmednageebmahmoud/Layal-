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
                url: `${this.basePath}getFullEnquiy?id=${id}`,
                method: 'get',
            });
        };
 
		//save enquiy  
	    closeEnquiry(id) {
			return h({
			    url: `${this.basePath}closeEnquiry?id=${id}`,
				method: 'post',
			});
		};



	};
	return new funcs();
}]);