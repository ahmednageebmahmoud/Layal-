ngApp.controller('albumTypesCtrl', ['$scope', '$http', 'albumTypesServ', function (s, h, albumTypesServ) {
    s.state = StateEnum;
    s.albumTypes = [];
    s.albumTypeFOP = {};
    s.albumTypeFilter = {
        skip: 0,
        take: 30
    };
    s.newAlbumType = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getAlbumTypes = reset => {

        if (reset) {
          
            s.albumTypeFilter.skip = 0;
            s.albumTypeFOP = new FOP(lengthWithOutDeleted(s.albumTypes));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        albumTypesServ.getAlbumTypes(s.albumTypeFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.albumTypes = [];
                    s.albumTypes = s.albumTypes.concat(d.data.Result);
                    s.albumTypeFilter.skip += s.albumTypeFilter.take;


                    if (s.albumTypeFOP && s.albumTypeFOP.paging)
                        s.albumTypeFOP = new FOP(lengthWithOutDeleted(s.albumTypes), s.albumTypeFOP.paging.currentPage,
                            s.albumTypeFOP.paging.limitPagesTake,
                            s.albumTypeFOP.paging.limitPagesSkip);
                    else
                        s.albumTypeFOP = new FOP(lengthWithOutDeleted(s.albumTypes));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getAlbumTypes", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getAlbumTypes", err);
        })
    };


    //============= Saves =================

    s.addNew = (form) => {
        if (form.$invalid) {
            s.albumTypeFrmErrorSubmit = true;
            return  ;
        }
        s.albumTypeFrmErrorSubmit = false;
        s.newAlbumType.State = StateEnum.create;
        BlockingService.block();
        albumTypesServ.saveChange(s.newAlbumType).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.albumTypes.push(d.data.Result);
                        s.newAlbumType = {};
                        
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

    //============= Delete ================
    s.delete = albumType => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            albumType.State = StateEnum.delete;
            BlockingService.block();
            albumTypesServ.saveChange(albumType).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.albumTypes.splice(s.albumTypes.findIndex(c => c.Id == albumType.Id), 1)
                            s.reFop(s.albumTypes.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= E D I T I  =================
    //change row for edit 
    s.changeEdit = albumType => {
        if (!albumType) return;

        //Check if a editing process is currently working .. if true must be reset this opration
        if (s.albumTypeItemEditBackup && s.itemEditId) {
            //get object editing and fill from backup
            s.cancelEdit();
        }


        //change case for enable editaing
        s.itemEditId = albumType.Id;
        //save object editing in temp for replace if usre cancel edit
        s.albumTypeItemEditBackup = angular.copy(albumType);
    };

    //cancel edit
    s.cancelEdit = () => {
        s.albumTypes[s.albumTypes.findIndex(c => c.Id == s.itemEditId)] = s.albumTypeItemEditBackup;
        s.itemEditId = null;
        s.albumTypeItemEditBackup = null;
    };

    //Save Edit
    s.saveEdit = albumTypeItem => {
        albumTypeItem = albumTypeItem || s.albumTypes[s.newAlbumType.albumTypes.findIndex(c => c.Id == s.itemEditId)];

        if (!albumTypeItem) return;


        //Check Name Ar & Name En
        if (s.propertyIsFalthy(albumTypeItem.NameAr)) {
            albumTypeItem.NameArIsIsRequierd = true;
            s.albumTypeErrorEdting = true;
            return;
        } else if (albumTypeItem.NameAr.length > 50) {
            albumTypeItem.NameArIsIsMaxlength = true;
            s.albumTypeErrorEdting = true;
            return;
        }

        if (s.propertyIsFalthy(albumTypeItem.NameEn)) {
            albumTypeItem.NameEnIsIsRequierd = true;
            s.albumTypeErrorEdting = true;
            return;
        } else if (albumTypeItem.NameEn.length > 50) {
            albumTypeItem.NameEnIsIsMaxlength = true;
            s.albumTypeErrorEdting = true;
            return;
        }

        albumTypeItem.State = StateEnum.update;
        BlockingService.block();
        albumTypesServ.saveChange(albumTypeItem).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.itemEditId = null;
                        s.albumTypeItemEditBackup = null;
                    } break;
            }
            co('res-savechnage-edit', d.data);
        })
    };




    //============= Other =================
    s.reFop = length => {
        s.albumTypeFOP.reFop(length);
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
    s.getAlbumTypes();
}]);