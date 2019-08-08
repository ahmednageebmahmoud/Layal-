ngApp.service('albumTypesServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/AlbumTypes/' };



	//Methods
        getAlbumTypes(filter) {
            return h({
                url: `${this.basePath}getAlbumTypes?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save albumType  
        saveChange(albumType) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:albumType
			});
		};



	};
	return new funcs();
}]);