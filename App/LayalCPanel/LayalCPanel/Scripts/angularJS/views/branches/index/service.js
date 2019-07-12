ngApp.service('branchesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Branches/' };



	//Methods
        getBranches(filter) {
            return h({
                url: `${this.basePath}getBranches?accountTypeId=${filter.accounTypeId}&languageId=${filter.languageId}&countryId=${filter.countryId}&cityId=${filter.cityId}&createDateFrom=${filter.createDateFrom}&createDateTo=${filter.createDateTo}&branchName=${filter.branchName}&email=${filter.email}&phoneNumber=${filter.phoneNumber}&adddress=${filter.adddress}&take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };


		//save branch  
        saveChange(branch) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:branch
			});
		};



	};
	return new funcs();
}]);