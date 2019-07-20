ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {

		//Getter
	    get basePath() { return '/EventCoordinations/' };


	//Methods
 
        getEmployeeDistributionWorks(eventId) {
            return h({
                url: `${this.basePath}getEmployeeDistributionWorks?eventId=${eventId}`,
                method: 'get',
            });
        };

        getEvent(eventId) {
            return h({
                url: `${this.basePath}getEvent?eventId=${eventId}`,
                method: 'get',
            });
        };

        getTasks(eventId) {
            return h({
                url: `${this.basePath}getTaks?eventId=${eventId}`,
                method: 'get',
            });
        };
 
        finshedTask(eventId) {
            return h({
                url: `${this.basePath}finshedTask?eventId=${eventId}`,
                method: 'get',
            });
        };

	    
		//save event  
        saveChange(newTask) {
			return h({
			    url: `${this.basePath}saveChange`,
				method: 'post',
				data: newTask
			});
		};

	};
	return new funcs();
}]);