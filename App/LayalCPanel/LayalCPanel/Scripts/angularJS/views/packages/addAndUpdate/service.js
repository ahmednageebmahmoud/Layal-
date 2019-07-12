ngApp.service('addAUpdatePackagesServ', ['$http', function (h) {

	class funcs {
		//Getter
		get basePath() { return '/Packages/' };



	//Methods
		//get Package By Id
		getPackageById(packageId) {
			return h({
			    url: `${this.basePath}getPackageById?packageId=${packageId}`,
				method: 'get',
			});
		};

		
		getItems() {
		    return h({
		        url: `${this.basePath}getItems`,
		        method: 'get',
		    });
		};

		saveChangePackageDeail(packageDetail) {
		    return h({
		        url: `${this.basePath}saveChangePackageDeail`,
		        method: 'post',
                data:packageDetail
		    });
		};

	    
		

		//save package  
		saveChangePackage(packag) {

            return h({
				url: `${this.basePath}SaveChange`,
				method: 'post',
				data:packag
			});
		};
		//saveChangeItem
		saveChangeCity(packageItem) {
			return h({
				url: `${this.basePath}SaveChangeCity`,
				method: 'post',
				data: packageItem
			});
		};


		
	};
	return new funcs();
}]);