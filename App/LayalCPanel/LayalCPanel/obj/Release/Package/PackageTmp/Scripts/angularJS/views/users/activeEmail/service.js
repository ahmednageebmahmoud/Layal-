ngApp.service('usersServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Users/' };



	//Methods
        sendActiveCodeToEmail(user) {
            return h({
                url: `${this.basePath}sendActiveCodeToEmail?id=${user.Id}&email=${user.Email}&userName=${user.UserName}`,
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
        activeEmail(user) {
			return h({
			    url: `${this.basePath}activeEmailByActiveCode?id=${user.Id}&activeCode=${user.ActiveCode}`,
				method: 'post',
			});
		};



	};
	return new funcs();
}]);