ngApp.controller('socialAccountTypesCtrl', ['$scope', '$http', 'socialAccountTypesServ', function (s, h, socialAccountTypesServ) {
    s.state = StateEnum;
    s.socialAccountTypes = [];
    s.socialAccountTypeFOP = {};
    s.socialAccountTypeFilter = {
        skip: 0,
        take: 30
    };
    s.newSocialAccountType = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getSocialAccountTypes = reset => {

        if (reset) {
          
            s.socialAccountTypeFilter.skip = 0;
            s.socialAccountTypeFOP = new FOP(lengthWithOutDeleted(s.socialAccountTypes));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        socialAccountTypesServ.getSocialAccountTypes(s.socialAccountTypeFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.socialAccountTypes = [];
                    s.socialAccountTypes = s.socialAccountTypes.concat(d.data.Result);
                    s.socialAccountTypeFilter.skip += s.socialAccountTypeFilter.take;


                    if (s.socialAccountTypeFOP && s.socialAccountTypeFOP.paging)
                        s.socialAccountTypeFOP = new FOP(lengthWithOutDeleted(s.socialAccountTypes), s.socialAccountTypeFOP.paging.currentPage,
                            s.socialAccountTypeFOP.paging.limitPagesTake,
                            s.socialAccountTypeFOP.paging.limitPagesSkip);
                    else
                        s.socialAccountTypeFOP = new FOP(lengthWithOutDeleted(s.socialAccountTypes));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getSocialAccountTypes", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getSocialAccountTypes", err);
        })
    };


    //============= Saves =================

    s.addNew = (form) => {
        if (form.$invalid) {
            s.socialAccountTypeFrmErrorSubmit = true;
            return  ;
        }
        s.socialAccountTypeFrmErrorSubmit = false;
        s.newSocialAccountType.State = StateEnum.create;
        BlockingService.block();
        socialAccountTypesServ.saveChange(s.newSocialAccountType).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.socialAccountTypes.push(d.data.Result);
                        s.newSocialAccountType = {};
                        
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
    s.delete = socialAccountType => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            socialAccountType.State = StateEnum.delete;
            BlockingService.block();
            socialAccountTypesServ.saveChange(socialAccountType).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.socialAccountTypes.splice(s.socialAccountTypes.findIndex(c => c.Id == socialAccountType.Id), 1)
                            s.reFop(s.socialAccountTypes.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= U P D A T E  =================
    //change row for edit 
    s.changeEdit = socialAccountType => {
        if (!socialAccountType) return;

        //Check if a editing process is currently working .. if true must be reset this opration
        if (s.socialAccountTypeItemEditBackup && s.itemEditId) {
            //get object editing and fill from backup
            s.cancelEdit();
        }


        //change case for enable editaing
        s.itemEditId = socialAccountType.Id;
        //save object editing in temp for replace if usre cancel edit
        s.socialAccountTypeItemEditBackup = angular.copy(socialAccountType);
    };

    //cancel edit
    s.cancelEdit = () => {
        s.socialAccountTypes[s.socialAccountTypes.findIndex(c => c.Id == s.itemEditId)] = s.socialAccountTypeItemEditBackup;
        s.itemEditId = null;
        s.socialAccountTypeItemEditBackup = null;
    };

    //Save Edit
    s.saveEdit = socialAccountTypeItem => {
        socialAccountTypeItem = socialAccountTypeItem || s.socialAccountTypes[s.newSocialAccountType.socialAccountTypes.findIndex(c => c.Id == s.itemEditId)];

        if (!socialAccountTypeItem) return;


        //Check Name Ar & Name En
        if (s.propertyIsFalthy(socialAccountTypeItem.NameAr)) {
            socialAccountTypeItem.NameArIsIsRequierd = true;
            s.socialAccountTypeErrorEdting = true;
            return;
        } else if (socialAccountTypeItem.NameAr.length > 50) {
            socialAccountTypeItem.NameArIsIsMaxlength = true;
            s.socialAccountTypeErrorEdting = true;
            return;
        }

        if (s.propertyIsFalthy(socialAccountTypeItem.NameEn)) {
            socialAccountTypeItem.NameEnIsIsRequierd = true;
            s.socialAccountTypeErrorEdting = true;
            return;
        } else if (socialAccountTypeItem.NameEn.length > 50) {
            socialAccountTypeItem.NameEnIsIsMaxlength = true;
            s.socialAccountTypeErrorEdting = true;
            return;
        }

        socialAccountTypeItem.State = StateEnum.update;
        BlockingService.block();
        socialAccountTypesServ.saveChange(socialAccountTypeItem).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.itemEditId = null;
                        s.socialAccountTypeItemEditBackup = null;
                    } break;
            }
            co('res-savechnage-edit', d.data);
        })
    };




    //============= Other =================
    s.reFop = length => {
        s.socialAccountTypeFOP.reFop(length);
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
    s.getSocialAccountTypes();
}]);