ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Events/' };


	//Methods

	    getEvent(id) {
            return h({
                url: `${this.basePath}getEventInformation?id=${id}`,
                method: 'get',
            });
	    };

	 
	    
 



	};
	return new funcs();
}]);