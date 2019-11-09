ngApp.controller('filesReceivedTypesCtrl', ['$scope', '$http', 'filesReceivedTypesServ', function (s, h, filesReceivedTypesServ) {
    s.state = StateEnum;
    s.filesReceivedTypes = [];
    s.filesReceivedTypeFOP = {};
    s.filesReceivedTypeFilter = {
        skip: 0,
        take: 30
    };
    s.newFilesReceivedType = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getFilesReceivedTypes = reset => {

        if (reset) {
          
            s.filesReceivedTypeFilter.skip = 0;
            s.filesReceivedTypeFOP = new FOP(lengthWithOutDeleted(s.filesReceivedTypes));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        filesReceivedTypesServ.getFilesReceivedTypes(s.filesReceivedTypeFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.filesReceivedTypes = [];
                    s.filesReceivedTypes = s.filesReceivedTypes.concat(d.data.Result);
                    s.filesReceivedTypeFilter.skip += s.filesReceivedTypeFilter.take;


                    if (s.filesReceivedTypeFOP && s.filesReceivedTypeFOP.paging)
                        s.filesReceivedTypeFOP = new FOP(lengthWithOutDeleted(s.filesReceivedTypes), s.filesReceivedTypeFOP.paging.currentPage,
                            s.filesReceivedTypeFOP.paging.limitPagesTake,
                            s.filesReceivedTypeFOP.paging.limitPagesSkip);
                    else
                        s.filesReceivedTypeFOP = new FOP(lengthWithOutDeleted(s.filesReceivedTypes));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getFilesReceivedTypes", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getFilesReceivedTypes", err);
        })
    };


    //============= Saves =================

    s.addNew = (form) => {
        if (form.$invalid) {
            s.filesReceivedTypeFrmErrorSubmit = true;
            return  ;
        }
        s.filesReceivedTypeFrmErrorSubmit = false;
        s.newFilesReceivedType.State = StateEnum.create;
        BlockingService.block();
        filesReceivedTypesServ.saveChange(s.newFilesReceivedType).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.filesReceivedTypes.push(d.data.Result);
                        s.newFilesReceivedType = {};
                        
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
    s.delete = filesReceivedType => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            filesReceivedType.State = StateEnum.delete;
            BlockingService.block();
            filesReceivedTypesServ.saveChange(filesReceivedType).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.filesReceivedTypes.splice(s.filesReceivedTypes.findIndex(c => c.Id == filesReceivedType.Id), 1)
                            s.reFop(s.filesReceivedTypes.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= U P D A T E  =================
    //change row for edit 
    s.changeEdit = filesReceivedType => {
        if (!filesReceivedType) return;

        //Check if a editing process is currently working .. if true must be reset this opration
        if (s.filesReceivedTypeItemEditBackup && s.itemEditId) {
            //get object editing and fill from backup
            s.cancelEdit();
        }


        //change case for enable editaing
        s.itemEditId = filesReceivedType.Id;
        //save object editing in temp for replace if usre cancel edit
        s.filesReceivedTypeItemEditBackup = angular.copy(filesReceivedType);
    };

    //cancel edit
    s.cancelEdit = () => {
        s.filesReceivedTypes[s.filesReceivedTypes.findIndex(c => c.Id == s.itemEditId)] = s.filesReceivedTypeItemEditBackup;
        s.itemEditId = null;
        s.filesReceivedTypeItemEditBackup = null;
    };

    //Save Edit
    s.saveEdit = filesReceivedTypeItem => {
        filesReceivedTypeItem = filesReceivedTypeItem || s.filesReceivedTypes[s.newFilesReceivedType.filesReceivedTypes.findIndex(c => c.Id == s.itemEditId)];

        if (!filesReceivedTypeItem) return;


        //Check Name Ar & Name En
        if (s.propertyIsFalthy(filesReceivedTypeItem.NameAr)) {
            filesReceivedTypeItem.NameArIsIsRequierd = true;
            s.filesReceivedTypeErrorEdting = true;
            return;
        } else if (filesReceivedTypeItem.NameAr.length > 50) {
            filesReceivedTypeItem.NameArIsIsMaxlength = true;
            s.filesReceivedTypeErrorEdting = true;
            return;
        }

        if (s.propertyIsFalthy(filesReceivedTypeItem.NameEn)) {
            filesReceivedTypeItem.NameEnIsIsRequierd = true;
            s.filesReceivedTypeErrorEdting = true;
            return;
        } else if (filesReceivedTypeItem.NameEn.length > 50) {
            filesReceivedTypeItem.NameEnIsIsMaxlength = true;
            s.filesReceivedTypeErrorEdting = true;
            return;
        }

        filesReceivedTypeItem.State = StateEnum.update;
        BlockingService.block();
        filesReceivedTypesServ.saveChange(filesReceivedTypeItem).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.itemEditId = null;
                        s.filesReceivedTypeItemEditBackup = null;
                    } break;
            }
            co('res-savechnage-edit', d.data);
        })
    };




    //============= Other =================
    s.reFop = length => {
        s.filesReceivedTypeFOP.reFop(length);
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
    s.getFilesReceivedTypes();
}]);