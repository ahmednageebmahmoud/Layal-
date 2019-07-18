ngApp.controller('usersCtrl', ['$scope', '$http', 'usersServ', function (s, h, usersServ) {
    s.state = StateEnum;
    s.users = [];
    s.userFOP = {};
    s.userFilter = {
        accounTypeId: null,
        languageId: null,
        countryId: null,
        cityId: null,
        createDateFrom:null,
        createDateTo: null,
        userName:'',
        email:'',
        phoneNumber: '',
        adddress: '',
        skip:0,
        take: Defaults.takeFromServer,

    };


    s.accountTypes = [
        {
            Id: null,
            AccountTypeName: Token.select
        }, {
            Id: 2,
            AccountTypeName: LangIsEn ? "Supervisor" : "مشرف"
        }, {
            Id: 3,
            AccountTypeName: LangIsEn ? "Branch Manager" : "مدير فرع"
        },
    {
        Id: 4,
        AccountTypeName: LangIsEn ? "Clinet" : "عميل"
    }];

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
        CityName: Token.select
    }];


    //============= G E T =================
    s.getUsers = reset => {

        if (reset) {
            
            s.userFilter.skip = 0;
            s.userFOP = new FOP(lengthWithOutDeleted(s.users));
        }

        s.userFilter.createDateFrom = $("#createDateFrom").val();
        s.userFilter.createDateTo=$("#createDateTo").val();

        let loading = BlockingService.generateLoding();
        loading.show();
        usersServ.getUsers(s.userFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                      if (reset) 
            s.users = [];
                    s.users = s.users.concat(d.data.Result);
                    s.userFilter.skip += s.userFilter.take;


                    if (s.userFOP && s.userFOP.paging)
                        s.userFOP = new FOP(lengthWithOutDeleted(s.users), s.userFOP.paging.currentPage,
                            s.userFOP.paging.limitPagesTake,
                            s.userFOP.paging.limitPagesSkip);
                    else
                        s.userFOP = new FOP(lengthWithOutDeleted(s.users));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getUsers", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getUsers", err);
        })
    };

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


    //============= Saves =================

    s.saveChange = () => {
        if (s.getUsers.length == 0) {
            SMSSweet.alert(Token.noDataForSave, RequestTypeEnum.warning);
            return true;
        }
        BlockingService.block();
        usersServ.saveChange(s.users).then(d => {
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })

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
    s.getUsers();
}]);