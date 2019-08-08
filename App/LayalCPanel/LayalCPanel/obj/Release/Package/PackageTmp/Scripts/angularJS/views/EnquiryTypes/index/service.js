ngApp.service('enquiryTypesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/EnquiryTypes/' };



	//Methods
        getEnquiryTypes(filter) {
            return h({
                url: `${this.basePath}getEnquiryTypes?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save enquiryType  
        saveChange(enquiryType) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:enquiryType
			});
		};



	};
	return new funcs();
}]);