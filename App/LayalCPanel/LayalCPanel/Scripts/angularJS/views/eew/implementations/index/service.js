ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {
		//Getter
	    get basePath() { return '/EEW/' };
	
    //Methods
        getEvents(filter) {
            return h({
                url: `${this.basePath}getEvents?workTypeId=${worksTypesEnnum.Implementation}`,
                method: 'post',
                data: filter
            });
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems?isForFilter=${true}`,
                method: 'get',
            });
        };

        taskFinsh(eventId) {
            return h({
                url: `${this.basePath}taskFinsh?eventId=${eventId}&workTypeId=${worksTypesEnnum.Implementation}`,
                method: 'get',
            });
        };

	};
	return new funcs();
}]);