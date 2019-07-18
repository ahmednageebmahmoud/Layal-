ngApp.service('usersPagesPrivilegesServ', ['$http', function (h) {

	class funcs {

		//Getter
	    get basePath() { return '/UsersPrivileges/' };



	//Methods
		getUsersPagesPrivileges(filter) {
			return h({
                url: `${this.basePath}getUsersPagesPrivileges?menuId=${filter.menuId}&userId=${filter.userId}`,
				method: 'get',
			});
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };


		//save usersPagesPrivilege  
        saveChange(usersPagesPrivilege) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:usersPagesPrivilege
			});
		};



	};
	return new funcs();
}]);