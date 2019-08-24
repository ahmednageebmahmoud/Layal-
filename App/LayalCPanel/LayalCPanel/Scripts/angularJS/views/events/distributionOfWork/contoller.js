/// <reference path="../../../../_references.js" />
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

   
    s.branches = [{
        Id: null,
        BranchName: Token.select
    }];

    s.worksTypesEnnum = worksTypesEnnum;
    s.workTypes =[{Id:null,WorkTypeName:Token.select},...workTypesList];
    s.employeeDistributionWorks = [];
    


    //============= G E T =================
    //get items
    s.getEmployees = (brancId) => {
        if (!brancId) return;
        BlockingService.block();
        eventsServ.getEmployees(brancId).then(d => {
        BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (brancId == branchId)
                    {
                        //معنى كدا ان دول الموظفين الاساسين وهما بيتملو اول  لما الصفحة تحمل
                    s.employees = s.employees.concat(d.data.Result);
                    s.employeesTarget = s.employees;
                    }
                    else
                    {
                        s.newEmpWork.IsBasicBranch = true;
                        s.employeesTarget = [{
                            Id: null,
                            UserName: Token.select
                        },... d.data.Result];

                    }
                        
                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getEmployees", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEmployees", err);
        })
    };

    s.getItems = (branhId) => {

        let loading = BlockingService.generateLoding();
        loading.show();
        eventsServ.getItems(branhId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.branches = s.branches.concat(d.data.Result.Branches);
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
            co("G E T - getEmployeeDistributionWorks", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getEmployeeDistributionWorks", err);
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
        if (!s.newEmpWork.BranchId)
            s.newEmpWork.BranchId = branchId;

        BlockingService.block();
        eventsServ.saveChange(s.newEmpWork).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.newEmpWork = d.data.Result;
                    s.employeeDistributionWorks.push(angular.copy(s.newEmpWork));
                 s.reset();


                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType, () => {
            s.reSelect();
            });
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

    s.reset = () => {
        s.newEmpWork = {
            EmployeeId: null,
            WorkTypeId: null
        };
        s.employeesTarget = s.employees;
        setTimeout(()=>{
            s.reSelect();
        },400);
    }
    s.reSelect=()=>{
        $("select[serchbale]").select2();

    }

    //Call Functions
    s.getItems(branchId);
    s.getEmployees(branchId);
    s.getEmployeeDistributionWorks();
}]);