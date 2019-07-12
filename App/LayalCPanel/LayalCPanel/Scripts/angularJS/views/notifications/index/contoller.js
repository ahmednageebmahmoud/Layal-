ngApp.controller('notificationsCtrl', ['$scope', '$http', 'notificationsServ', function (s, h, notificationsServ) {
    s.notifications = [];
    s.notifyFOP = {};
    s.notifyFilter = {
        skip:0,
        take:30,
        pageId: null,
        stateId: null

    };

    s.pages = [{
        Id: null,
        PageName: Token.select
    }];
    
    s.states = [{
        Id: null,
        StateName: Token.select
    },
    {
        Id: true,
        StateName: Token.read
    },
    {
        Id: false,
        StateName: Token.notRead
    }];
   


    //============= G E T =================
    s.getNotifications = reset => {

        if (reset) {
            s.notifyFilter.skip = 0;
            s.notifyFOP = new FOP(lengthWithOutDeleted(s.notifications));
        }


        let loading = BlockingService.generateLoding();
        loading.show();
        notificationsServ.getNotifications(s.notifyFilter).then(d => {
            loading.hide();
            if (reset)
                s.notifications = [];

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.notifications = s.notifications.concat(d.data.Result);
                    s.notifyFilter.skip += s.notifyFilter.take;


                    if (s.notifyFOP && s.notifyFOP.paging)
                        s.notifyFOP = new FOP(lengthWithOutDeleted(s.notifications), s.notifyFOP.paging.currentPage,
                            s.notifyFOP.paging.limitPagesTake,
                            s.notifyFOP.paging.limitPagesSkip);
                    else
                        s.notifyFOP = new FOP(lengthWithOutDeleted(s.notifications));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getNotifications", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getNotifications", err);
        })
    };

    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        notificationsServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.pages = s.pages.concat(d.data.Result.Pages);
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



    //============= Other =================
    s.reFop = length => {
        s.notifyFOP.reFop(length);
    };



    //Call Functions
    s.getItems();
    s.getNotifications();
}]);