ngApp.controller('usersCtrl', ['$scope', '$http', 'usersServ', function (s, h, usersServ) {
    s.state = StateEnum;
    s.userSocialAccount = { AccountTypeId: null };
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

    s.accountTypeEnum = AccountTypesEnum;


    s.allowActiveCode=false;
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

    s.saocialAccountTypes = [{
        Id: null,
        SocialAccountTypeName: Token.select,
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
                    s.saocialAccountTypes = s.saocialAccountTypes.concat(d.data.Result.SaocialAccountTypes);
                    
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
                    s.user.DateOfBirth=new Date(Date.parse(s.user.DateOfBirthDisplay))
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
                    //نحدث بيانات المستخدم فى اللوكل استورج
                    Auth.addUserInformation(d.data.Result);

                    s.disapledEmail=false;
                    s.allowActiveCode = false;
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

    s.addSocialAccount = (form) => {
        if (form.$invalid) {
            s.userFormSubmitErroSoc = true;
            return;
        }
        s.userSocialAccount.State = StateEnum.create;
        s.userFormSubmitErroSoc = false;
        BlockingService.block();
        usersServ.addSocialAccount(s.userSocialAccount).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.userSocialAccount = { AccountTypeId:null};
                    if (!s.user.SocialAccounts)
                        s.user.SocialAccounts = [];

                    s.user.SocialAccounts.push(d.data.Result);
                } break;
            }
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("G E T - addASocialAccount", d);
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - addASocialAccount", err);
        });
    };

    s.deleteSocailAccount = acc => {
        SMSSweet.delete(() => {
            //Yes Delete
            acc.State = StateEnum.delete;
            BlockingService.block();
            usersServ.addSocialAccount(acc).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.user.SocialAccounts.splice(s.user.SocialAccounts.findIndex(c => c.Id == acc.Id), 1)
                        } break;
                };
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-deleteSocailAccount-del', d.data);
            });
        });

    }


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