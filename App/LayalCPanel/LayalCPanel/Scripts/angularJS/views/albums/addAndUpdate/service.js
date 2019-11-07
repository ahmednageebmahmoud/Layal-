ngApp.service('albumsServ', ['$http', function (h) {

	class funcs {

		//Getter
        get basePath() { return '/Albums/' };



	//Methods
          getAlbum(id) {
            return h({
                url: `${this.basePath}getAlbumById?id=${id}`,
                method: 'get',
            });
        };
	    

     

		//save album  
        saveChange(album) {
            let data = new FormData();

            data.append("album.Id", album.Id);
            data.append("album.NameAr", album.NameAr);
            data.append("album.NameEn", album.NameEn);
            data.append("album.DescriptionAr", album.DescriptionAr);
            data.append("album.DescriptionEn", album.DescriptionEn);
            data.append("album.State", album.State);
            
            if(    album.AlbumFiles)
            album.AlbumFiles.forEach((f, index) => {
                data.append(`album.AlbumFiles[${index}].Id`,        f.Id);
                data.append(`album.AlbumFiles[${index}].File`,      f.File);
                data.append(`album.AlbumFiles[${index}].State`,     f.State);
                data.append(`album.AlbumFiles[${index}].FileUrl`,   f.FileUrl);
            });
            



			return h({
                url: `${this.basePath}saveChange`,
				method: 'post',
				data: data,
				headers: { 'Content-Type': angular.undefined }

			});
		};



	};
	return new funcs();
}]);