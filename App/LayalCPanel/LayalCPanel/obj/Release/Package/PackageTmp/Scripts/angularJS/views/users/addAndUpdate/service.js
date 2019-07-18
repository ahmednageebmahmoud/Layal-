ngApp.service('usersServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Users/' };



	//Methods
        getUsers(filter) {
            return h({
                url: `${this.basePath}getUsers?accountTypeId=${filter.accounTypeId}&languageId=${filter.languageId}&countryId=${filter.countryId}&cityId=${filter.cityId}&createDateFrom=${filter.createDateFrom}&createDateTo=${filter.createDateTo}&userName=${filter.userName}&email=${filter.email}&phoneNumber=${filter.phoneNumber}&adddress=${filter.adddress}&take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };

	    getUser(id) {
            return h({
                url: `${this.basePath}getUser?id=${id}`,
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