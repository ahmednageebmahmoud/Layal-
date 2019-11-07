ngApp.controller('eventCtrl', ['$scope', '$http', 'eventsServ', function (s, h, eventsServ) {
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
        CreateDateTo: null,
        IsFinshed: null
    };
    s.worksTypesEnum = worksTypesEnnum;

    s.checkBoxList = [
    { Id: null, Name: Token.select },
    { Id: true, Name: Token.checked },
    { Id: false, Name: Token.unChecked }];

    s.finshedStatus = [
 { Id: null, Name: Token.select },
 { Id: true, Name: Token.finshed },
 { Id: false, Name: Token.notFinshed }];

    
    s.checkActiveList = [
{ Id: null, Name: Token.select },
{ Id: true, Name: Token.active },
{ Id: false, Name: Token.unActive }];

    s.packages = [
{ Id: null, PackageName: Token.select }];
 
    
    

    //============= G E T =================
    s.getEvents = reset => {

        if (reset) {
            s.eventFilter.skip = 0;
            s.eventFOP = new FOP(lengthWithOutDeleted(s.events));
        }


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
     
    s.taskFinsh = event=> {
            //show confirm delete
            SMSSweet.delete(() => {
                //is approve must be deleted
                BlockingService.block();
                eventsServ.taskFinsh(event.Id).then(d => {
                    BlockingService.unBlock();
                    switch (d.data.RequestType) {
                        case RequestTypeEnum.sucess:
                            {
                                event.IsFinshed = true;

                            } break;
                    }
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    co('res-taskFinsh', d.data);
                })
            }, null, LangIsEn?"Are you sure to you want finsh this task?":"هل انت متاكد من انك تريد انهاء المهمة ؟");

    }


    //============= Other =================
    s.reFop = length => {
        s.eventFOP.reFop(length);
    };

    //Call Functions
    s.getItems();
    s.getEvents();
}]);