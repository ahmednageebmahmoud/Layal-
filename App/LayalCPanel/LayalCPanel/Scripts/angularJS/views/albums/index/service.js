ngApp.service('albumsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Albums/' };



	//Methods
        getAlbums(filter) {
            return h({
                url: `${this.basePath}getAlbums?take=${filter.take}&skip=${filter.skip}`,
                method: 'get',
            });
        };

     

		//save album  
        saveChange(album) {

			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data:album
			});
		};



	};
	return new funcs();
}]);