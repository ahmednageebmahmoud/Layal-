ngApp.controller('eventSurveyQuestionTypesCtrl', ['$scope', '$http', 'eventSurveyQuestionTypesServ', function (s, h, eventSurveyQuestionTypesServ) {
    s.state = StateEnum;
    s.eventSurveyQuestionTypes = [];
    s.eventSurveyQuestionTypeFOP = {};
    s.eventSurveyQuestionTypeFilter = {
        skip: 0,
        take: 30
    };
    s.newEventSurveyQuestionType = {
        NameAr:null,
        NameEn:null
    }




    //============= G E T =================
    s.getEventSurveyQuestionTypes = reset => {

        if (reset) {
            s.eventSurveyQuestionTypeFilter.skip = 0;
            s.eventSurveyQuestionTypeFOP = new FOP(lengthWithOutDeleted(s.eventSurveyQuestionTypes));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        eventSurveyQuestionTypesServ.getEventSurveyQuestionTypes(s.eventSurveyQuestionTypeFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.eventSurveyQuestionTypes = [];
                    s.eventSurveyQuestionTypes = s.eventSurveyQuestionTypes.concat(d.data.Result);
                    s.eventSurveyQuestionTypeFilter.skip += s.eventSurveyQuestionTypeFilter.take;


                    if (s.eventSurveyQuestionTypeFOP && s.eventSurveyQuestionTypeFOP.paging)
                        s.eventSurveyQuestionTypeFOP = new FOP(lengthWithOutDeleted(s.eventSurveyQuestionTypes), s.eventSurveyQuestionTypeFOP.paging.currentPage,
                            s.eventSurveyQuestionTypeFOP.paging.limitPagesTake,
                            s.eventSurveyQuestionTypeFOP.paging.limitPagesSkip);
                    else
                        s.eventSurveyQuestionTypeFOP = new FOP(lengthWithOutDeleted(s.eventSurveyQuestionTypes));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEventSurveyQuestionTypes", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEventSurveyQuestionTypes", err);
        })
    };


    //============= Saves =================

    s.addNew = (form) => {
        if (form.$invalid) {
            s.eventSurveyQuestionTypeFrmErrorSubmit = true;
            return  ;
        }
        s.eventSurveyQuestionTypeFrmErrorSubmit = false;
        s.newEventSurveyQuestionType.State = StateEnum.create;
        BlockingService.block();
        eventSurveyQuestionTypesServ.saveChange(s.newEventSurveyQuestionType).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.eventSurveyQuestionTypes.push(d.data.Result);
                        s.newEventSurveyQuestionType = {};
                        
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
    s.delete = eventSurveyQuestionType => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            eventSurveyQuestionType.State = StateEnum.delete;
            BlockingService.block();
            eventSurveyQuestionTypesServ.saveChange(eventSurveyQuestionType).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.eventSurveyQuestionTypes.splice(s.eventSurveyQuestionTypes.findIndex(c => c.Id == eventSurveyQuestionType.Id), 1)
                            s.reFop(s.eventSurveyQuestionTypes.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= U P D A T E  =================
    //change row for edit 
    s.changeEdit = eventSurveyQuestionType => {
        if (!eventSurveyQuestionType) return;

        //Check if a editing process is currently working .. if true must be reset this opration
        if (s.eventSurveyQuestionTypeItemEditBackup && s.itemEditId) {
            //get object editing and fill from backup
            s.cancelEdit();
        }


        //change case for enable editaing
        s.itemEditId = eventSurveyQuestionType.Id;
        //save object editing in temp for replace if usre cancel edit
        s.eventSurveyQuestionTypeItemEditBackup = angular.copy(eventSurveyQuestionType);
    };

    //cancel edit
    s.cancelEdit = () => {
        s.eventSurveyQuestionTypes[s.eventSurveyQuestionTypes.findIndex(c => c.Id == s.itemEditId)] = s.eventSurveyQuestionTypeItemEditBackup;
        s.itemEditId = null;
        s.eventSurveyQuestionTypeItemEditBackup = null;
    };

    //Save Edit
    s.saveEdit = eventSurveyQuestionTypeItem => {
        eventSurveyQuestionTypeItem = eventSurveyQuestionTypeItem || s.eventSurveyQuestionTypes[s.newEventSurveyQuestionType.eventSurveyQuestionTypes.findIndex(c => c.Id == s.itemEditId)];

        if (!eventSurveyQuestionTypeItem) return;


        //Check Name Ar & Name En
        if (s.propertyIsFalthy(eventSurveyQuestionTypeItem.NameAr)) {
            eventSurveyQuestionTypeItem.NameArIsIsRequierd = true;
            s.eventSurveyQuestionTypeErrorEdting = true;
            return;
        } else if (eventSurveyQuestionTypeItem.NameAr.length > 50) {
            eventSurveyQuestionTypeItem.NameArIsIsMaxlength = true;
            s.eventSurveyQuestionTypeErrorEdting = true;
            return;
        }

        if (s.propertyIsFalthy(eventSurveyQuestionTypeItem.NameEn)) {
            eventSurveyQuestionTypeItem.NameEnIsIsRequierd = true;
            s.eventSurveyQuestionTypeErrorEdting = true;
            return;
        } else if (eventSurveyQuestionTypeItem.NameEn.length > 50) {
            eventSurveyQuestionTypeItem.NameEnIsIsMaxlength = true;
            s.eventSurveyQuestionTypeErrorEdting = true;
            return;
        }

        eventSurveyQuestionTypeItem.State = StateEnum.update;
        BlockingService.block();
        eventSurveyQuestionTypesServ.saveChange(eventSurveyQuestionTypeItem).then(d => {
            BlockingService.unBlock();
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess:
                    {
                        s.itemEditId = null;
                        s.eventSurveyQuestionTypeItemEditBackup = null;
                    } break;
            }
            co('res-savechnage-edit', d.data);
        })
    };




    //============= Other =================
    s.reFop = length => {
        s.eventSurveyQuestionTypeFOP.reFop(length);
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
    s.getEventSurveyQuestionTypes();
}]);