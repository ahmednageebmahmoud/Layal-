ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {

		//Getter
	    get basePath() { return '/EEW/' };


	//Methods
 
        getEmployeeDistributionWorks(eventId) {
            return h({
                url: `${this.basePath}getEmployeeDistributionWorks?eventId=${eventId}&workTypeId=${worksTypesEnnum.Coordination}`,
                method: 'get',
            });
        };

        getEvent(eventId) {
            return h({
                url: `${this.basePath}getEvent?eventId=${eventId}&workTypeId=${worksTypesEnnum.Coordination}`,
                method: 'get',
            });
        };

        getTasks(eventId) {
            return h({
                url: `${this.basePath}getTaks?eventId=${eventId}`,
                method: 'get',
            });
        };
 
        taskFinsh(eventId) {
            return h({
                url: `${this.basePath}taskFinsh?eventId=${eventId}&workTypeId=${worksTypesEnnum.Coordination}`,
                method: 'get',
            });
        };

	    
		//save event  
        saveChange(newTask) {
			return h({
			    url: `${this.basePath}saveChangeCoordination`,
				method: 'post',
				data: newTask
			});
		};

	};
	return new funcs();
}]);