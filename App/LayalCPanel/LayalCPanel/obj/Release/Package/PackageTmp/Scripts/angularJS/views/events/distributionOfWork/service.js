ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Events/' };


	//Methods

        getItems(branchId) {
            return h({
                url: `${this.basePath}GetDistributionOfWorkItems?branchId=${branchId}`,
                method: 'get',
            });
        };
 
        getEmployeeDistributionWorks(eventId) {
            return h({
                url: `${this.basePath}getEmployeeDistributionWorks?eventId=${eventId}`,
                method: 'get',
            });
        };

 
		//save event  
        saveChange(newWork) {
			return h({
			    url: `${this.basePath}saveChangeDistributionOfWork`,
				method: 'post',
				data: newWork
			});
		};

	};
	return new funcs();
}]);