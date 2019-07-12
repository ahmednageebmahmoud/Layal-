ngApp.controller('branchesCtrl', ['$scope', '$http', 'branchesServ', function (s, h, branchesServ) {
    s.state = StateEnum;
    s.branches = [];
    s.branchFOP = {};
    s.branchFilter = {
        accounTypeId: null,
        languageId: null,
        countryId: null,
        cityId: null,
        createDateFrom:null,
        createDateTo: null,
        branchName:'',
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
    s.getBranches = reset => {

        if (reset) {
           
            s.branchFilter.skip = 0;
            s.branchFOP = new FOP(lengthWithOutDeleted(s.branches));
        }

        s.branchFilter.createDateFrom = $("#createDateFrom").val();
        s.branchFilter.createDateTo=$("#createDateTo").val();

        let loading = BlockingService.generateLoding();
        loading.show();
        branchesServ.getBranches(s.branchFilter).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    if (reset) 
                        s.branches = [];
                    s.branches = s.branches.concat(d.data.Result);
                    s.branchFilter.skip += s.branchFilter.take;


                    if (s.branchFOP && s.branchFOP.paging)
                        s.branchFOP = new FOP(lengthWithOutDeleted(s.branches), s.branchFOP.paging.currentPage,
                            s.branchFOP.paging.limitPagesTake,
                            s.branchFOP.paging.limitPagesSkip);
                    else
                        s.branchFOP = new FOP(lengthWithOutDeleted(s.branches));

                } break;

                case RequestTypeEnum.error:
                case RequestTypeEnum.warning:
                case RequestTypeEnum.info:
                    SMSSweet.alert(d.data.Message, d.data.RequestType);
                    break;
            }
            co("G E T - getBranches", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getBranches", err);
        })
    };

    //get items
    s.getItems = () => {

        let loading = BlockingService.generateLoding();
        loading.show();
        branchesServ.getItems().then(d => {
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
        if (s.getBranches.length == 0) {
            SMSSweet.alert(Token.noDataForSave, RequestTypeEnum.warning);
            return true;
        }
        BlockingService.block();
        branchesServ.saveChange(s.branches).then(d => {
            SMSSweet.alert(d.data.Message, d.data.RequestType);
            co("P O S T - saveChange", d);
            BlockingService.unBlock();
        }).catch(err => {
            BlockingService.unBlock();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - saveChange", err);
        })

    };

    //============= Delete ================
    s.delete = branch => {
        //show confirm delete
        SMSSweet.delete(() => {
            //Yes Delete
            branch.State = StateEnum.delete;
            BlockingService.block();
            branchesServ.saveChange(branch).then(d => {
                BlockingService.unBlock();
                switch (d.data.RequestType) {
                    case RequestTypeEnum.sucess:
                        {
                            s.branches.splice(s.branches.findIndex(c => c.Id == branch.Id), 1)
                            s.reFop(s.branches.length);
                        } break;
                }
                SMSSweet.alert(d.data.Message, d.data.RequestType);
                co('res-savechnage-del', d.data);
            });
        });
    };

    //============= Other =================
    s.reFop = length => {
        s.branchFOP.reFop(length);
    };

    s.checkAllowDisplay = (priv) => {

        if (!priv.CanEdit && !priv.CanDelete)
            priv.CanDisplay = false;
        else
            priv.CanDisplay = true;


    };


    //Call Functions
    s.getItems();
    s.getBranches();
}]);