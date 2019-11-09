ngApp.controller('enquiryTypesCtrl', ['$scope', '$http', 'enquiryTypesServ', function (s, h, enquiryTypesServ) {
    s.state = StateEnum;
    s.enquiryTypes = [];
    s.enquiryTypeFOP = {};
    s.enquiryTypeFilter = {
        skip: 0,
        take: 30
    };





    //============= G E T =================
    s.getEnquiryTypes = reset => {

        if (reset) {
            s.enquiryTypeFilter.skip = 0;
            s.enquiryTypeFOP = new FOP(lengthWithOutDeleted(s.enquiryTypes));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        enquiryTypesServ.getEnquiryTypes(s.enquiryTypeFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.enquiryTypes = [];
                    s.enquiryTypes = s.enquiryTypes.concat(d.data.Result);
                    s.enquiryTypeFilter.skip += s.enquiryTypeFilter.take;


                    if (s.enquiryTypeFOP && s.enquiryTypeFOP.paging)
                        s.enquiryTypeFOP = new FOP(lengthWithOutDeleted(s.enquiryTypes), s.enquiryTypeFOP.paging.currentPage,
                            s.enquiryTypeFOP.paging.limitPagesTake,
                            s.enquiryTypeFOP.paging.limitPagesSkip);
                    else
                        s.enquiryTypeFOP = new FOP(lengthWithOutDeleted(s.enquiryTypes));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEnquiryTypes", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEnquiryTypes", err);
        })
    };


    //============= Saves =================

    s.addNew = (form, enquiryType) => {
        if (form.$invalid) {
            s.enquiryTypeFrmErrorSubmit = true;
            return  ;
        }
        s.enquiryTypeFrmErrorSubmit = false;
        s.newEnquiryType.State = StateEnum.create;
        BlockingService.block();
        enquiryTypesServ.saveChange(s.newEnquiryType).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.enquiryTypes.push(d.data.Result);
                        s.newEnquiryType = {};
                        
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
    s.delete = enquiryType => {
        //show confirm delete
        SMSSweet.delete(() => {
            debugger;
            //Yes Delete
            enquiryType.State = StateEnum.delete;
            BlockingService.block();
            enquiryTypesServ.saveChange(enquiryType).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.enquiryTypes.splice(s.enquiryTypes.findIndex(c => c.Id == enquiryType.Id), 1)
                            s.reFop(s.enquiryTypes.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= U P D A T E  =================
    //change row for edit 
    s.changeEdit = enquiryType => {
        if (!enquiryType) return;

        //Check if a editing process is currently working .. if true must be reset this opration
        if (s.enquiryTypeItemEditBackup && s.itemEditId) {
            //get object editing and fill from backup
            s.cancelEdit();
        }


        //change case for enable editaing
        s.itemEditId = enquiryType.Id;
        //save object editing in temp for replace if usre cancel edit
        s.enquiryTypeItemEditBackup = angular.copy(enquiryType);
    };

    //cancel edit
    s.cancelEdit = () => {
        s.enquiryTypes[s.enquiryTypes.findIndex(c => c.Id == s.itemEditId)] = s.enquiryTypeItemEditBackup;
        s.itemEditId = null;
        s.enquiryTypeItemEditBackup = null;
    };

    //Save Edit
    s.saveEdit = enquiryTypeItem => {
        enquiryTypeItem = enquiryTypeItem || s.enquiryTypes[s.newEnquiryType.enquiryTypes.findIndex(c => c.Id == s.itemEditId)];

        if (!enquiryTypeItem) return;


        //Check Name Ar & Name En
        if (s.propertyIsFalthy(enquiryTypeItem.NameAr)) {
            enquiryTypeItem.NameArIsIsRequierd = true;
            s.enquiryTypeErrorEdting = true;
            return;
        } else if (enquiryTypeItem.NameAr.length > 50) {
            enquiryTypeItem.NameArIsIsMaxlength = true;
            s.enquiryTypeErrorEdting = true;
            return;
        }

        if (s.propertyIsFalthy(enquiryTypeItem.NameEn)) {
            enquiryTypeItem.NameEnIsIsRequierd = true;
            s.enquiryTypeErrorEdting = true;
            return;
        } else if (enquiryTypeItem.NameEn.length > 50) {
            enquiryTypeItem.NameEnIsIsMaxlength = true;
            s.enquiryTypeErrorEdting = true;
            return;
        }

        enquiryTypeItem.State = StateEnum.update;
        BlockingService.block();
        enquiryTypesServ.saveChange(enquiryTypeItem).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.itemEditId = null;
                        s.enquiryTypeItemEditBackup = null;
                    } break;
            }
            co('res-savechnage-edit', d.data);
        })
    };




    //============= Other =================
    s.reFop = length => {
        s.enquiryTypeFOP.reFop(length);
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
    s.getEnquiryTypes();
}]);