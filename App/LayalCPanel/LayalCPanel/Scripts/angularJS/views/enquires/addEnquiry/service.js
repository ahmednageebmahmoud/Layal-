ngApp.service('enquiresServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Enquires/' };


	//Methods

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };

		//save enquiy  
        saveChange(enquiy) {
			return h({
                url: `${this.basePath}AddEnqu`,
				method: 'post',
				data:enquiy
			});
		};



	};
	return new funcs();
}]);