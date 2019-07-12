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
        CountryId:  Number(getQueryStringValue("countryId"))||null,
        CityId:     Number(getQueryStringValue("cityId"))||null,
        BranchId:   Number(getQueryStringValue("branchId"))||null,
        PhoneNo: getQueryStringValue("phoneNo")||null,
        UserName:decodeURI( getQueryStringValue("fName") )|| null,
        EnquiryId: getQueryStringValue("enquiryId")||null
    };
    s.accountTypeDisapled = s.user.EnquiryId ? true : false;
    s.accountTypes = [
       { Id: null, AccountTypeName: Token.select },
       { Id: 2, AccountTypeName: LangIsEn ? "Supervisor" : "مشرف" },
       { Id: 3, AccountTypeName: LangIsEn ? "Branch Manager" : "مدير فرع" },
       { Id: 4, AccountTypeName: LangIsEn ? "Clinet" : "عميل" }
    ];

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

    s.branches = [{
        Id: null,
        BranchName: Token.select,
        CityId:null
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

    //Get Users
    s.getUser = () => {
        if (!userId)
            return;

        let loading = BlockingService.generateLoding();
        loading.show();
        usersServ.getUser(userId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.user = d.data.Result;
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
    s.getItems();
    s.getUser();
}]);