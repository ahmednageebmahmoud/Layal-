ngApp.controller('eventsCtrl', ['$scope', '$http', 'eventsServ', function (s, h, eventsServ) {
    s.state = StateEnum;
    s.events = [];
    s.eventFOP = {};
    s.eventFilter = {
        skip: 0,
        take: Defaults.takeFromServer,
        NameGroom: null,
        NameBride: null,
        IsLogoAr: null,
        IsNamesAr: null,
        IsClinetCustomLogo: null,
        IsActive: null,
        PackageId: null,
        BranchId: null,
        EventDateTo: null,
        EventDateFrom: null,
        CreateDateFrom: null,
        CreateDateTo: null
    };

    s.workTypes = workTypesList;
    s.accountTypeEnum = AccountTypesEnum;

    s.surveyQuestions = [];
    s.checkBoxList = [
    { Id: null, Name: Token.select },
    { Id: true, Name: Token.checked },
    { Id: false, Name: Token.unChecked }];

    s.checkActiveList = [
{ Id: null, Name: Token.select },
{ Id: true, Name: Token.active },
{ Id: false, Name: Token.unActive }];

    s.packages = [
{ Id: null, PackageName: Token.select }];
    s.branches = [
{ Id: null, BranchName: Token.select }];



    //============= G E T =================
    s.getEvents = reset => {

        if (reset) {
            s.eventFilter.skip = 0;
            s.eventFOP = new FOP(lengthWithOutDeleted(s.events));
        }

        s.eventFilter.CreateDateFrom = $("#createDateFrom").val();
        s.eventFilter.CreateDateTo = $("#createDateTo").val();
        s.eventFilter.EventDateFrom = $("#eventDateTimeFrom").val();
        s.eventFilter.EventDateTo = $("#eventDateTimeTo").val();

        let loading = BlockingService.generateLoding();
        loading.show();

        eventsServ.getEvents(s.eventFilter).then(d => {
            loading.hide();

            if (reset)
                s.events = [];
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.events = s.events.concat(d.data.Result);
                    s.eventFilter.skip += s.eventFilter.take;
                    if (s.eventFOP && s.eventFOP.paging)
                        s.eventFOP = new FOP(lengthWithOutDeleted(s.events), s.eventFOP.paging.currentPage,
                            s.eventFOP.paging.limitPagesTake,
                            s.eventFOP.paging.limitPagesSkip);
                    else
                        s.eventFOP = new FOP(lengthWithOutDeleted(s.events));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEvents", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEvents", err);
        })
    };

    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.packages = s.packages.concat(d.data.Result.Packages);
                    s.branches = s.branches.concat(d.data.Result.Branches);;
                 
                    setTimeout(() => {
                        $("select[serchbale]").select2();

                    }, 1200)
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getItems", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getItems", err);
        })
    };
    //============= Saves =================

    s.saveChange = () => {
        if (s.getEvents.length == 0) {
            SMSSweet.alert(Token.noDataForSave, RequestTypeEnum.warning);
            return true;
        }
        BlockingService.block();
        eventsServ.saveChange(s.events).then(d => {
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })

    };

    //update Event Survey Questions
   
    s.updateEventSurveyQuestions = () => {
        BlockingService.block();
        eventsServ.saveChangeEventSurveyQuestions(s.surveyQuestions).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    bootstrapModelHide("createCustomSurvey");
                } break;
            }

            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - updateEventSurveyQuestions", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - updateEventSurveyQuestions", err);
        })
    }

    //update Event Photographers
     s.updateEventPhotographers = () => {
        BlockingService.block();
         eventsServ.updateEventPhotographers(s.photographers).then(d => {
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    bootstrapModelHide("eventPhotographers");
                } break;
            }

            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - updateEventPhotographers", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - updateEventPhotographers", err);
        })
    }
    
    //============= Delete ================
    s.delete = event => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            event.State = StateEnum.delete;
            BlockingService.block();
            eventsServ.saveChange(event).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.events.splice(s.events.findIndex(c => c.Id == event.Id), 1)
                            s.reFop(s.events.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= Other =================
    s.reFop = length => {
        s.eventFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {

        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;
    };

    //================= Other ======================
    s.showCreateCustomSurveyModel = eve =>
    {
        
        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getSurveyQuestionsforUpdateEventSurvey(eve.Id).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.surveyQuestions = d.data.Result;
            bootstrapModelShow("createCustomSurvey");

                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getItems", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getItems", err);
        })
    };

    //show Event Photographers Model
    s.showEventPhotographersModel = eve => {
        s.photographers = null;
        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getEventPhotographers(eve.Id).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.photographers = d.data.Result;
                    s.cultPhotographersSelectedCount();
                    bootstrapModelShow("eventPhotographers");

                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEventPhotographers", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEventPhotographers", err);
        })
    };

    s.cultPhotographersSelectedCount = () => {
        s.photographersSelectedCount = s.photographers.filter(c=> c.IsSelected).length;
    }
    //Call Functions
    s.getItems();
    s.getEvents();
}]);