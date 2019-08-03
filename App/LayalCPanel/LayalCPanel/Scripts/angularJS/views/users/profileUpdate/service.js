ngApp.service('usersServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Users/' };



	//Methods
       

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };

	    getUser() {
            return h({
                url: `${this.basePath}getUserProfileData`,
                method: 'get',
            });
        };

	    addSocialAccount(account) {
	        return h({
	            url: `${this.basePath}addSocialAccount`,
	            method: 'post',
	            data: account
	        });
	    }
 
		//save user  
        saveChange(user) {
			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:user
			});
		};
        sendActiveCodeToEmail(user) {
            return h({
                url: `${this.basePath}sendActiveCodeToEmail?id=${user.Id}&email=${user.Email}&userName=${user.UserName}`,
                method: 'get',
            });
        };

	};
	return new funcs();
}]);