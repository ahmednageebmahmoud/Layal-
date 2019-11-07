ngApp.controller('addAndUpdateCtrl', ['$scope', '$http', 'eventsServ', '$filter', function (s, h, eventsServ, $filter) {
    s.state = StateEnum;

    var eventId = getQueryStringValue("id");
 
    s.details = [];
    s.newDetail={};
    s.basicInfo = {
        EventId: eventId,
        State: StateEnum.create,
        EventArchivDetails:[]
    };

    //============= G E T =================
    s.getEvent = () => {
        if (!eventId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getEvent(eventId).then(d => {
            loading.hide();
            s.allowManage = false;
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.event = d.data.Result;
                    s.allowManage = (!s.event.EventWorkStatusIsFinshed.ArchivingAndSaveing && !s.event.EventWorkStatusIsFinshedByCurrentUser.ArchivingAndSaveing) || !s.event.EventWorkStatusIsFinshedByCurrentUser.ArchivingAndSaveing;

                    
                } break;
                default:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEvent", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEvent", err);
        });
    }

    s.getDetails = () => {
        if (!eventId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getDetails(eventId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.basicInfo = d.data.Result || {
                        EventId: eventId,
                        State: StateEnum.create
                    };
                    if (d.data.Result)
                    s.basicInfo.State = StateEnum.update;
                } break;
                    default:
                        SMSSweet.alert(d.data.Message, d.data.RequestType);
                        break;

            }
            co("G E T - getDetails", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getDetails", err);
        });
    }



    //============= Saves =================
    
    s.eventArvhivSaveChange = (form) => {
        if (form.$invalid) {
            s.basicInfoFrmSubmitError = true;
            return;
        }
        s.basicInfoFrmSubmitError = false;

        BlockingService.block();
        eventsServ.eventArvhivSaveChange(s.basicInfo).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.basicInfo.State = d.data.Result;
                    s.basicInfo.State = StateEnum.update;
                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("G E T - addBaisInformation", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - addBaisInformation", err);
        });
    };

    s.detailSaveChange = (form) => {
        if (form.$invalid) {
            s.newDetailFrmSubmitError = true;
            return;
        }
        s.newDetailFrmSubmitError = false;

        s.newDetail.EventId = eventId;
        s.newDetail.EventArchivId = s.basicInfo.Id;
        s.newDetail.State = StateEnum.create;

        BlockingService.block();
        eventsServ.saveChange(s.newDetail).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.basicInfo.EventArchivDetails.push(d.data.Result);
                    s.newDetail = {};

                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("G E T - saveChange", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        });
    };

    //============= Delete ================
    s.delete = taks => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            taks.State = StateEnum.delete;
            BlockingService.block();
            eventsServ.saveChange(taks).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.basicInfo.EventArchivDetails.splice(s.basicInfo.EventArchivDetails.findIndex(c => c.Id == taks.Id), 1);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    s.taskFinsh = () => {
        SMSSweet.delete(() => {
            //Yes Delete
            
            BlockingService.block();
            eventsServ.taskFinsh(eventId).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.allowManage = false;

                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-finshedTask', d.data);
            });
        },null,LangIsEn?'Are you sure your add all task and you want close this step for moving to new stwep?':'هل انت متاكد من انك قمت بـ اضافة كل المهام وتريد اغلاق هذة المرحلة للتنقل للمرحلة التالية؟');
    };

    //============= Other =================
    s.reFop = length => {
        s.eventFOP.reFop(length);
    };


    //Call Functions
    s.getDetails();
    s.getEvent();
}]);