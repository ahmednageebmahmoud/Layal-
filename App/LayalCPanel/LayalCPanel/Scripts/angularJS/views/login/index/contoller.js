ngApp.controller('loginCtrl', ['$scope', '$http', 'loginServ', function (s, h, loginServ) {


    returnUrl = getQueryStringValue("ReturnUrl");
    s.loginInfo = {
        RememberMe: false
    };
    //============= G E T =================
    s.login = () => {
        BlockingService.block();
        localStorage.clear()
        loginServ.login(s.loginInfo).then(d => {
            BlockingService.unBlock();

            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    //Save User Information In Storage
                    Auth.addUserInformation(d.data.Result);
                    window.location.href = d.data.Result.ReturnUrl || returnUrl || '/';

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - login", d);
        }).catch(err => {
            BlockingService.unBlock();

            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - login", err);
        })
    };

}]);