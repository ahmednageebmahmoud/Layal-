ngApp.controller('albumsCtrl', ['$scope', '$http', 'albumsServ', function (s, h, albumsServ) {
    s.state = StateEnum;
    s.albums = [];
    s.albumFOP = {};
    s.albumFilter = {
        skip: 0,
        take: 30
    };
    s.newAlbum = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getAlbums = reset => {

        if (reset) {
          
            s.albumFilter.skip = 0;
            s.albumFOP = new FOP(lengthWithOutDeleted(s.albums));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        albumsServ.getAlbums(s.albumFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.albums = [];
                    s.albums = s.albums.concat(d.data.Result);
                    s.albumFilter.skip += s.albumFilter.take;


                    if (s.albumFOP && s.albumFOP.paging)
                        s.albumFOP = new FOP(lengthWithOutDeleted(s.albums), s.albumFOP.paging.currentPage,
                            s.albumFOP.paging.limitPagesTake,
                            s.albumFOP.paging.limitPagesSkip);
                    else
                        s.albumFOP = new FOP(lengthWithOutDeleted(s.albums));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getAlbums", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getAlbums", err);
        })
    };


    //============= Saves =================

    

    //============= Delete ================
    s.delete = album => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            album.State = StateEnum.delete;
            BlockingService.block();
            albumsServ.saveChange(album).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.albums.splice(s.albums.findIndex(c => c.Id == album.Id), 1)
                            s.reFop(s.albums.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= E D I T I  =================
    
 
 



    //============= Other =================
    s.reFop = length => {
        s.albumFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {
        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;
    };
    
    //للتحقق القيم المطلوبة
    s.propertyIsFalthy = (prop, propChange) => {
        return prop ? false : true;

    }
    //للتحقق من عدد القيم المدخلة 
    s.propertyIsMaxLength = (prop, mxLength) => {
        if (!prop) return false;
        return prop.length > mxLength;
    };

    //Call Functions
    s.getAlbums();
}]);