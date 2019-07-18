ngApp.controller('eventCoordinationCtrl', ['$scope', '$http', 'eventsServ', function (s, h, eventsServ) {
    s.state = StateEnum;

    var eventId = getQueryStringValue("id");
    s.newTask = {
        EventId: eventId,
        TaskNumber: 1,
        State: StateEnum.create
    };
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
                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("G E T - getEvent", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEvent", err);
        });
    }



    //============= Saves =================
    s.saveChange = (form) => {
        if (form.$invalid) {
            s.newTaskFrmSubmitError = true;
            return;
        }
        s.newTaskFrmSubmitError = false;
        BlockingService.block();
        eventsServ.saveChange(s.newTask).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.tasks.push(angular.copy(s.newTask));
                    s.newTask = {};
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
    s.delete = workEmp => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            workEmp.State = StateEnum.delete;
            BlockingService.block();
            eventsServ.saveChange(workEmp).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.employeeDistributionWorks.splice(s.employeeDistributionWorks.findIndex(c => c.Id == workEmp.Id), 1);
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

    //Call Functions
    s.getEvent();
}]);