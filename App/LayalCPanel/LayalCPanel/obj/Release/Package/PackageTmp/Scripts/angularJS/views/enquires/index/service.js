ngApp.service('enquiresServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Enquires/' };



	//Methods
        getEnquires(filter) {
            return h({
                url: `${this.basePath}getEnquires?enquiryTypeId=${filter.EnquiryTypeId}&month=${filter.Month}&day=${filter.Day}&year=${filter.Year}&countryId=${filter.CountryId}&cityId=${filter.CityId}&createDateTimeFrom=${filter.CreateDateFrom}&createDateTimeTo=${filter.CreateDateTo}&firstName=${filter.FirstName}&lastName=${filter.LastName}&phone=${filter.PhoneNo}&take=${filter.take}&skip=${filter.skip}&branchId=${filter.BranchId}&isLinkedClinet=${filter.IsLinkedClinet}`,
                method: 'get',
            });
        };

        getItems() {
            return h({
                url: `${this.basePath}getItems`,
                method: 'get',
            });
        };


		//save enquiy  
        saveChange(enquiy) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:enquiy
			});
		};

        //add New Status
        addNewStatus(enquiy) {

            return h({
                url: `${this.basePath}addNewStatus`,
                method: 'post',
                data:enquiy
            });
        };

	    

	};
	return new funcs();
}]);