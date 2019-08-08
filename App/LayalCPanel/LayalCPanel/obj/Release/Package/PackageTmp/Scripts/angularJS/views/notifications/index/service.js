ngApp.service('notificationsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Notifications/' };



	//Methods
        getNotifications(filter) {
            return h({
                url: `${this.basePath}getNotifications?take=${filter.take}&skip=${filter.skip}&pageId=${filter.pageId}&iIsRead=${filter.stateId}`,
                method: 'get',
            });
        };

     
        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };

        


	};
	return new funcs();
}]);