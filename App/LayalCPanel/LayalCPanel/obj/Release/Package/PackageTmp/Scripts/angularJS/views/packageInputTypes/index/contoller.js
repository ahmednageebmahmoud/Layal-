ngApp.controller('packageInputTypesCtrl', ['$scope', '$http', 'packageInputTypesServ', function (s, h, packageInputTypesServ) {
    s.state = StateEnum;
    s.packageInputTypes = [];
    s.packageInputTypeFOP = {};
    s.packageInputTypeFilter = {
        skip: 0,
        take: 30
    };
    s.newPackageInputType = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getPackageInputTypes = reset => {

        if (reset) {
          
            s.packageInputTypeFilter.skip = 0;
            s.packageInputTypeFOP = new FOP(lengthWithOutDeleted(s.packageInputTypes));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        packageInputTypesServ.getPackageInputTypes(s.packageInputTypeFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.packageInputTypes = [];
                    s.packageInputTypes = s.packageInputTypes.concat(d.data.Result);
                    s.packageInputTypeFilter.skip += s.packageInputTypeFilter.take;


                    if (s.packageInputTypeFOP && s.packageInputTypeFOP.paging)
                        s.packageInputTypeFOP = new FOP(lengthWithOutDeleted(s.packageInputTypes), s.packageInputTypeFOP.paging.currentPage,
                            s.packageInputTypeFOP.paging.limitPagesTake,
                            s.packageInputTypeFOP.paging.limitPagesSkip);
                    else
                        s.packageInputTypeFOP = new FOP(lengthWithOutDeleted(s.packageInputTypes));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getPackageInputTypes", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getPackageInputTypes", err);
        })
    };


    //============= Saves =================

    s.addNew = (form) => {
        if (form.$invalid) {
            s.packageInputTypeFrmErrorSubmit = true;
            return  ;
        }
        s.packageInputTypeFrmErrorSubmit = false;
        s.newPackageInputType.State = StateEnum.create;
        BlockingService.block();
        packageInputTypesServ.saveChange(s.newPackageInputType).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.packageInputTypes.push(d.data.Result);
                        s.newPackageInputType = {};
                        
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
    s.delete = packageInputType => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            packageInputType.State = StateEnum.delete;
            BlockingService.block();
            packageInputTypesServ.saveChange(packageInputType).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.packageInputTypes.splice(s.packageInputTypes.findIndex(c => c.Id == packageInputType.Id), 1)
                            s.reFop(s.packageInputTypes.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= E D I T I  =================
    //change row for edit 
    s.changeEdit = packageInputType => {
        if (!packageInputType) return;

        //Check if a editing process is currently working .. if true must be reset this opration
        if (s.packageInputTypeItemEditBackup && s.itemEditId) {
            //get object editing and fill from backup
            s.cancelEdit();
        }


        //change case for enable editaing
        s.itemEditId = packageInputType.Id;
        //save object editing in temp for replace if usre cancel edit
        s.packageInputTypeItemEditBackup = angular.copy(packageInputType);
    };

    //cancel edit
    s.cancelEdit = () => {
        s.packageInputTypes[s.packageInputTypes.findIndex(c => c.Id == s.itemEditId)] = s.packageInputTypeItemEditBackup;
        s.itemEditId = null;
        s.packageInputTypeItemEditBackup = null;
    };

    //Save Edit
    s.saveEdit = packageInputTypeItem => {
        packageInputTypeItem = packageInputTypeItem || s.packageInputTypes[s.newPackageInputType.packageInputTypes.findIndex(c => c.Id == s.itemEditId)];

        if (!packageInputTypeItem) return;


        //Check Name Ar & Name En
        if (s.propertyIsFalthy(packageInputTypeItem.NameAr)) {
            packageInputTypeItem.NameArIsIsRequierd = true;
            s.packageInputTypeErrorEdting = true;
            return;
        } else if (packageInputTypeItem.NameAr.length > 50) {
            packageInputTypeItem.NameArIsIsMaxlength = true;
            s.packageInputTypeErrorEdting = true;
            return;
        }

        if (s.propertyIsFalthy(packageInputTypeItem.NameEn)) {
            packageInputTypeItem.NameEnIsIsRequierd = true;
            s.packageInputTypeErrorEdting = true;
            return;
        } else if (packageInputTypeItem.NameEn.length > 50) {
            packageInputTypeItem.NameEnIsIsMaxlength = true;
            s.packageInputTypeErrorEdting = true;
            return;
        }

        packageInputTypeItem.State = StateEnum.update;
        BlockingService.block();
        packageInputTypesServ.saveChange(packageInputTypeItem).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.itemEditId = null;
                        s.packageInputTypeItemEditBackup = null;
                    } break;
            }
            co('res-savechnage-edit', d.data);
        })
    };




    //============= Other =================
    s.reFop = length => {
        s.packageInputTypeFOP.reFop(length);
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
    s.getPackageInputTypes();
}]);