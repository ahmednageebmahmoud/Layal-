ngApp.service('filesReceivedTypesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/FilesReceivedTypes/' };



	//Methods
        getFilesReceivedTypes(filter) {
            return h({
                url: `${this.basePath}getFilesReceivedTypes?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save filesReceivedType  
        saveChange(filesReceivedType) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:filesReceivedType
			});
		};



	};
	return new funcs();
}]);