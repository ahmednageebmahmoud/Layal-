ngApp.service('usersServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Users/' };



	//Methods
        getUsers(filter) {
            return h({
                url: `${this.basePath}getUsers`,
                method: 'post',
                data:filter
            });
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };


		//save user  
        saveChange(user) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:user
			});
		};



	};
	return new funcs();
}]);