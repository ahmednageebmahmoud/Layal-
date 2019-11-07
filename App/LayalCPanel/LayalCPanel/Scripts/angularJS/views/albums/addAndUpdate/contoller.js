ngApp.controller('albumsCtrl', ['$scope', '$http', 'albumsServ', function (s, h, albumsServ) {
    s.state = StateEnum;
    s.albums = [];
    s.albumFOP = {};



    s.newAlbum = {
        Id: getQueryStringValue('id') || null,
        NameAr: null,
        NameEn: null,
        DescriptionAr: null,
        DescriptionEn: null,
        AlbumFiles: [],
        State: StateEnum.create,
    }




    //============= G E T =================
    s.getAlbum = reset => {
        if (!s.newAlbum.Id) return;

        let loading = BlockingService.generateLoding();
        loading.show();
        albumsServ.getAlbum(s.newAlbum.Id).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newAlbum = d.data.Result;
                    s.newAlbum.State = StateEnum.update;
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getAlbum", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getAlbum", err);
        })
    };


    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.albumFrmErrorSubmit = true;
            return;
        }
        s.albumFrmErrorSubmit = false;
        BlockingService.block();
        albumsServ.saveChange(s.newAlbum).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.newAlbum = d.data.Result;
                        s.newAlbum.State = StateEnum.update;
                    } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })

    };

    //-+-+-+-+-+-+ Delete -+-+-+-++-+++-+-+
    s.deleteImage = index => {
        if (s.newAlbum.State == StateEnum.update) {
            //Set State Delete For Delete From Server
            s.newAlbum.AlbumFiles[index].State = StateEnum.delete;

        } else {
            //Delete By Splice
            s.newAlbum.AlbumFiles.splice(index, 1)
        }
    };

    //=+=+=+=+=+=+ Other =+=++=+=+=+==+=+=+
    //Uplaod Images
    s.uplaodImages = files => {
        if (s.newAlbum.AlbumFiles.length >= 10) {
            SMSSweet.alert(LangIsEn ? "No more than 10 photos can be downloaded" : "لا يمكن تحميل اكثر من 10 صور", RequestTypeEnum.error);
            return;
        }

        for (let i = 0; i <= files.length - 1; i++) {
            var fileReaer = new FileReader();
            fileReaer.readAsDataURL(files[i]);
            let file = files[i];
            fileReaer.onload = (d) => {
                if (s.newAlbum.AlbumFiles.length < 10) {
                    s.newAlbum.AlbumFiles.push({
                        State: StateEnum.create,
                        File: file,
                        FileUrl: d.target.result
                    });
                    s.$apply();
                }
            }
        }

    }


    //Call Functions
    s.getAlbum();
}]);