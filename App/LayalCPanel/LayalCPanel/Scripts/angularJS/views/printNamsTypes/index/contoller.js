ngApp.controller('printNamesTypesCtrl', ['$scope', '$http', 'printNamesTypesServ', function (s, h, printNamesTypesServ) {
    s.state = StateEnum;
    s.printNamesTypes = [];
    s.printNamesTypeFOP = {};
    s.printNamesTypeFilter = {
        skip: 0,
        take: 30
    };
    s.newPrintNamesType = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getPrintNamesTypes = reset => {

        if (reset) {
          
            s.printNamesTypeFilter.skip = 0;
            s.printNamesTypeFOP = new FOP(lengthWithOutDeleted(s.printNamesTypes));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        printNamesTypesServ.getPrintNamesTypes(s.printNamesTypeFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.printNamesTypes = [];
                    s.printNamesTypes = s.printNamesTypes.concat(d.data.Result);
                    s.printNamesTypeFilter.skip += s.printNamesTypeFilter.take;


                    if (s.printNamesTypeFOP && s.printNamesTypeFOP.paging)
                        s.printNamesTypeFOP = new FOP(lengthWithOutDeleted(s.printNamesTypes), s.printNamesTypeFOP.paging.currentPage,
                            s.printNamesTypeFOP.paging.limitPagesTake,
                            s.printNamesTypeFOP.paging.limitPagesSkip);
                    else
                        s.printNamesTypeFOP = new FOP(lengthWithOutDeleted(s.printNamesTypes));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getPrintNamesTypes", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getPrintNamesTypes", err);
        })
    };


    //============= Saves =================

    s.addNew = (form) => {
        if (form.$invalid) {
            s.printNamesTypeFrmErrorSubmit = true;
            return  ;
        }
        s.printNamesTypeFrmErrorSubmit = false;
        s.newPrintNamesType.State = StateEnum.create;
        BlockingService.block();
        printNamesTypesServ.saveChange(s.newPrintNamesType).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.printNamesTypes.push(d.data.Result);
                        s.newPrintNamesType = {};
                        
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
    s.delete = printNamesType => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            printNamesType.State = StateEnum.delete;
            BlockingService.block();
            printNamesTypesServ.saveChange(printNamesType).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.printNamesTypes.splice(s.printNamesTypes.findIndex(c => c.Id == printNamesType.Id), 1)
                            s.reFop(s.printNamesTypes.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= U P D A T E  =================
    //change row for edit 
    s.changeEdit = printNamesType => {
        if (!printNamesType) return;

        //Check if a editing process is currently working .. if true must be reset this opration
        if (s.printNamesTypeItemEditBackup && s.itemEditId) {
            //get object editing and fill from backup
            s.cancelEdit();
        }


        //change case for enable editaing
        s.itemEditId = printNamesType.Id;
        //save object editing in temp for replace if usre cancel edit
        s.printNamesTypeItemEditBackup = angular.copy(printNamesType);
    };

    //cancel edit
    s.cancelEdit = () => {
        s.printNamesTypes[s.printNamesTypes.findIndex(c => c.Id == s.itemEditId)] = s.printNamesTypeItemEditBackup;
        s.itemEditId = null;
        s.printNamesTypeItemEditBackup = null;
    };

    //Save Edit
    s.saveEdit = printNamesTypeItem => {
        printNamesTypeItem = printNamesTypeItem || s.printNamesTypes[s.newPrintNamesType.printNamesTypes.findIndex(c => c.Id == s.itemEditId)];

        if (!printNamesTypeItem) return;


        //Check Name Ar & Name En
        if (s.propertyIsFalthy(printNamesTypeItem.NameAr)) {
            printNamesTypeItem.NameArIsIsRequierd = true;
            s.printNamesTypeErrorEdting = true;
            return;
        } else if (printNamesTypeItem.NameAr.length > 50) {
            printNamesTypeItem.NameArIsIsMaxlength = true;
            s.printNamesTypeErrorEdting = true;
            return;
        }

        if (s.propertyIsFalthy(printNamesTypeItem.NameEn)) {
            printNamesTypeItem.NameEnIsIsRequierd = true;
            s.printNamesTypeErrorEdting = true;
            return;
        } else if (printNamesTypeItem.NameEn.length > 50) {
            printNamesTypeItem.NameEnIsIsMaxlength = true;
            s.printNamesTypeErrorEdting = true;
            return;
        }

        printNamesTypeItem.State = StateEnum.update;
        BlockingService.block();
        printNamesTypesServ.saveChange(printNamesTypeItem).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.itemEditId = null;
                        s.printNamesTypeItemEditBackup = null;
                    } break;
            }
            co('res-savechnage-edit', d.data);
        })
    };




    //============= Other =================
    s.reFop = length => {
        s.printNamesTypeFOP.reFop(length);
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
    s.getPrintNamesTypes();
}]);