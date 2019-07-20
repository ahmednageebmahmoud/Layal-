ngApp.controller('homeCtrl', ['$scope', '$http', 'homeServ','$rootScope', function (s, h, homeServ,rs) {
    //============= G E T =================
    s.getItems = reset => {
        let loading = BlockingService.generateLoding();
        loading.show();

        homeServ.getItems().then(d => {
            loading.hide();
            if (reset)
                s.home = [];

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.employeeWorks = d.data.Result.EmployeeWorks;
                
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

    s.getItems();
}]);