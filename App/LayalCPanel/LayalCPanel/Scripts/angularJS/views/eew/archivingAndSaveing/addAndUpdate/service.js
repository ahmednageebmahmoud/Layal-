ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {

		//Getter
	    get basePath() { return '/EEW/' };


	//Methods
 
        
        getEvent(eventId) {
            return h({
                url: `${this.basePath}getEvent?eventId=${eventId}&workTypeId=${worksTypesEnnum.ArchivingAndSaveing}`,
                method: 'get',
            });
        };

        getDetails(eventId) {
            return h({
                url: `${this.basePath}getArchivingAndSaveingDetails?eventId=${eventId}`,
                method: 'get',
            });
        };
 
        taskFinsh(eventId) {
            return h({
                url: `${this.basePath}taskFinsh?eventId=${eventId}&workTypeId=${worksTypesEnnum.ArchivingAndSaveing}`,
                method: 'get',
            });
        };

	    
		//save event  
        saveChange(obj) {
			return h({
			    url: `${this.basePath}EventArvhivDetailSaveChange`,
				method: 'post',
				data: obj
			});
		};

        eventArvhivSaveChange(obj) {
            return h({
                url: `${this.basePath}eventArvhivSaveChange`,
                method: 'post',
                data: obj
            });
        };

	    

	};
	return new funcs();
}]);