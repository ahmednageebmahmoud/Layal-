ngApp.controller('usersCtrl', ['$scope', '$http', 'usersServ', function (s, h, usersServ) {
    s.state = StateEnum;
    s.users = [];
    s.userFOP = {};
    var userId = getQueryStringValue("id");
    s.user = {
        Id: userId,
        State: userId ? StateEnum.update : StateEnum.create,
        AccountTypeId: 4,
        LanguageId: 2,
        CountryId: null,
        CityId:   null,
        BranchId:  null,
        PhoneNo:  null,
        UserName: null,
        EnquiryId:  null,
    };

    s.allowActiveCode=true;
    s.languages = [{
        Id: null,
        LanguageName: Token.select
    }, {
        Id: 1,
        LanguageName: "English"
    }, {
        Id: 2,
        LanguageName: "العربية"
    }];

    s.countries = [{
        Id: null,
        CountryName: Token.select
    }];
    s.cities = [{
        Id: null,
        CityName: Token.select,
        CountryId: null
    }];

 
    

    //============= G E T =================
    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        usersServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.countries = s.countries.concat(d.data.Result.Countries);
                    s.cities = s.cities.concat(d.data.Result.Cities);
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

    //Get Users
    s.getUser = () => {
     

        let loading = BlockingService.generateLoding();
        loading.show();
        usersServ.getUser().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.user = d.data.Result;
                    s.OldMail = s.user.Email;
                    s.user.Password = null;
                    s.user.State = StateEnum.update;

                    setTimeout(() => {
                        $("select[serchbale]").select2();
                    }, 500)


                } break;
                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getUser", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getUser", err);
        })
    }
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        usersServ.getItems().then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.countries = s.countries.concat(d.data.Result.Countries);
                    s.cities = s.cities.concat(d.data.Result.Cities);
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
            s.userFormSubmitErro = true;
            return;
        }

        s.userFormSubmitErro = false;
        BlockingService.block();
        usersServ.saveChange(s.user).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.user = d.data.Result;
                    s.disapledEmail=false;
                    s.allowActiveCode = true;
                    s.OldMail = s.user.Email;
                    s.user.State = StateEnum.update;
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


    s.sendActiveCodeToEmail = form=> {

        s.userFormSubmitErro = false;
        BlockingService.block();
        usersServ.sendActiveCodeToEmail(s.user).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.allowActiveCode = false;
                    s.disapledEmail = true;
                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("G E T - sendActiveCodeToEmail", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - sendActiveCodeToEmail", err);
        });
    }

    //============= Other =================
    s.reFop = length => {
        s.userFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {

        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;


    };


    //Call Functions
    s.getUser();
    s.getItems();
}]);