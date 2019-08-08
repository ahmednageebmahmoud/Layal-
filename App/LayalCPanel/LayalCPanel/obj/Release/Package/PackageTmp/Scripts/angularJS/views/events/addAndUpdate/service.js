ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Events/' };


	//Methods

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };

	    getEvent(id) {
            return h({
                url: `${this.basePath}getEvent?id=${id}`,
                method: 'get',
            });
	    };

	 
	    
 
		//save event  
        saveChange(event) {
			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:event
			});
		};



	};
	return new funcs();
}]);