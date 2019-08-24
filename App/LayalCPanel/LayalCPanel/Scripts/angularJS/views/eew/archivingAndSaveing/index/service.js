ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {
		//Getter
	    get basePath() { return '/EEW/' };
	
    //Methods
        getEvents(filter) {
            return h({
                url: `${this.basePath}getEvents?workTypeId=${worksTypesEnnum.ArchivingAndSaveing}`,
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

            taskFinsh(info) {
            return h({
                url: `${this.basePath}taskFinshArchivingAndSaveing`,
                method: 'post',
                data:info
            });
        };

	    
	};
	return new funcs();
}]);