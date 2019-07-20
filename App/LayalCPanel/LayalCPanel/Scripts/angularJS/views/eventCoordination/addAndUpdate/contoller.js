ngApp.controller('eventCoordinationCtrl', ['$scope', '$http', 'eventsServ','$filter', function (s, h, eventsServ,$filter) {
    s.state = StateEnum;

    var eventId = getQueryStringValue("id");
 
    s.tasks = [];
    //============= G E T =================
    s.getEvent = () => {
        if (!eventId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getEvent(eventId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.event = d.data.Result;
                    s.isFinshed = s.event.CoordinationWorkStatus.IsFinshed
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

    s.getTasks = () => {
        if (!eventId) return;
        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getTasks(eventId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.tasks = d.data.Result;
                    s.tasks = $filter('orderBy')(s.tasks, 'TaskNumber')

                 s.newTask.TaskNumber = s.cultTskNumber();

                } break;
                    default:
                        SMSSweet.alert(d.data.Message, d.data.RequestType);
                        break;

            }
            co("G E T - getTasks", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getTasks", err);
        });
    }



    //============= Saves =================
    s.saveChange = (form) => {
        if (form.$invalid) {
            s.newTaskFrmSubmitError = true;
            return;
        }
        s.newTaskFrmSubmitError = false;
        s.newTask.EndTime = $('#endTime').val();
        s.newTask.StartTime = $('#startTime').val();
        BlockingService.block();
        eventsServ.saveChange(s.newTask).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.tasks = d.data.Result;
                    s.tasks = $filter('orderBy')(s.tasks, 'TaskNumber')

                    s.newTask = {
                        EventId: eventId,
                        TaskNumber: s.cultTskNumber(),
                        State: StateEnum.create
                    };
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
                            s.tasks.splice(s.tasks.findIndex(c => c.Id == taks.Id), 1);
                            s.tasks = $filter('orderBy')(s.tasks, 'TaskNumber')

                            s.newTask.TaskNumber= s.cultTskNumber();
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    s.finshedTask = () => {
        SMSSweet.delete(() => {
            //Yes Delete
            
            BlockingService.block();
            eventsServ.finshedTask(eventId).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.isFinshed = true;
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

    //جلب رقم المهمة الذى يجب ان ينفذ
    s.cultTskNumber = () => {

        if (!s.tasks) return 1;
        var taskNumber = 1;
        s.tasks.forEach(t=> {
            if (t.TaskNumber == taskNumber)
                taskNumber += 1;

        });

        return taskNumber;
    };
    s.newTask = {
        EventId: eventId,
        TaskNumber: s.cultTskNumber(),
        State: StateEnum.create
    };

    //Call Functions
    s.getTasks();
    s.getEvent();
}]);