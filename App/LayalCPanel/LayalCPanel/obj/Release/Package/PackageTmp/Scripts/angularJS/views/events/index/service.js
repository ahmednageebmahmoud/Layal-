ngApp.service('eventsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Events/' };



	//Methods
        getEvents(filter) {
            return h({
                url: `${this.basePath}getEvents`,
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


		//save event  
        saveChange(event) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:event
			});
		};

        //add New Status
        addNewStatus(event) {

            return h({
                url: `${this.basePath}addNewStatus`,
                method: 'post',
                data:event
            });
        };

	    

	};
	return new funcs();
}]);