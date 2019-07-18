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
        IsActive:null,
        PackageId:null,
        BranchId:null,
        EventDateTo: null,
        EventDateFrom: null,
        CreateDateFrom: null,
        CreateDateTo: null
    };

    

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

                    },1200)
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

    //add New Status
    s.addNewStatus = form=> {
        if (form.$invalid) {
            s.eventtStusSubmitErro = true;
            return;
        }
        s.eventtStusSubmitErro = false;

        BlockingService.block();
        eventsServ.addNewStatus(s.eventNewStatus).then(d => {
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - addNewStatus", d);
            BlockingService.unBlock();
            bootstrapModelHide("addStatus");

        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - addNewStatus", err);
        })
    };
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
    s.fillDayMax = month=> {
        switch (month) {
            case 2:
                return 29;
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                return 31;
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
        }
    };

    //================= Other ======================
    s.showAddStatus = event => {
        s.eventNewStatus = {
            EnquiryId: event.Id,
            EnquiryBranchId: event.BranchId,
            StatusId: null,
            IsBankTransferDeposit: true,
            ClinetName: event.FirstName + ' ' + event.LastName,
        };
        bootstrapModelShow("addStatus");
    };


    //Call Functions
    s.getItems();
    s.getEvents();
}]);