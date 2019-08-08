ngApp.service('usersServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Users/' };



	//Methods
    

        getItems() {
            return h({
                url: `${this.basePath}getItems?userInformaiton=true`,
                method: 'get',
            });
        };

	    getUser(id) {
            return h({
                url: `${this.basePath}getUser?id=${id}`,
                method: 'get',
            });
        };

	};
	return new funcs();
}]);