ngApp.controller('distributionOfWorkCtrl', ['$scope', '$http', 'eventsServ', function (s, h, eventsServ) {
    s.state = StateEnum;
    s.events = [];
    s.eventFOP = {};

    var eventId = getQueryStringValue("id");
    var branchId = getQueryStringValue("branchId");
    s.newEmpWork = {
        EmployeeId:null,
        WorkTypeId:null
    };
    s.employees = [{
        Id: null,
        UserName: Token.select
    }];
    	
    s.workTypes = [
        { Id: null,WorkTypeName: Token.select},
        { Id: 3, WorkTypeName: LangIsEn ? 'Coordination' : 'الاعداد والتنسيق' },
        { Id: 5, WorkTypeName: LangIsEn ? 'Archiving and Saveing' : 'الأرشفة و الحفظ	' },
        { Id: 6, WorkTypeName: LangIsEn?'Product processing':'تجهيز المنتاجات'},
        { Id: 7, WorkTypeName: LangIsEn?'Chooseing':'الاختيار'},
        { Id: 8, WorkTypeName: LangIsEn?'Digital processing':'المعالجة الرقمية'},
        { Id: 9, WorkTypeName: LangIsEn?'Preparing for printing':'الاعداد للطباعة	'},
        { Id: 10, WorkTypeName: LangIsEn?'Manufacturing':'التصنيع'},
        { Id: 11, WorkTypeName: LangIsEn ? 'Quality and review' : 'الجودة و المراجعة' },
        { Id: 12, WorkTypeName: LangIsEn?'Packaging':'التغليف'},
        { Id: 13, WorkTypeName: LangIsEn?'Transmission and delivery  ':'الارسال و التسليم'},
        { Id: 14, WorkTypeName: LangIsEn?'Archiving':'الأرشفة'},
    ];
    s.employeeDistributionWorks = [];
    //============= G E T =================
    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getItems(branchId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.employees = s.employees.concat(d.data.Result.Employees);

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

    s.getEmployeeDistributionWorks = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getEmployeeDistributionWorks(eventId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.employeeDistributionWorks = s.employeeDistributionWorks.concat(d.data.Result);

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
    s.saveChange = (form) => {
        if (form.$invalid) {
            s.addNewEmpWorkFromErrorSubmit = true;
            return;
        }
        s.addNewEmpWorkFromErrorSubmit = false;
        s.newEmpWork.State = StateEnum.create;
        s.newEmpWork.EventId = eventId;
        BlockingService.block();
        eventsServ.saveChange(s.newEmpWork).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newEmpWork = d.data.Result;
                    s.employeeDistributionWorks.push(angular.copy(s.newEmpWork));
                    s.newEmpWork={};
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
    s.getItems();
    s.getEmployeeDistributionWorks();
}]);