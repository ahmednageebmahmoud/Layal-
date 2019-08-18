ngApp.controller('branchesCtrl', ['$scope', '$http', 'branchesServ', function (s, h, branchesServ) {
    s.state = StateEnum;
    s.branches = [];
    s.branchFOP = {};
    var branchId = getQueryStringValue("id");
    s.branch = {
        Id: branchId,
        State: branchId ? StateEnum.update : StateEnum.create,
        CountryId: null,
        CityId: null
    };


    s.countries = [{
        Id: null,
        CountryName: Token.select
    }];
    s.cities = [{
        Id: null,
        CityName: Token.select,
        CountryId:null
    }];


    //============= G E T =================
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

    //Get Branches
    s.getBranch = () => {
        if (!branchId)
            return;

        let loading = BlockingService.generateLoding();
        loading.show();
        branchesServ.getBranch(branchId).then(d => {
            loading.hide();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.branch = d.data.Result;
                    s.branch.Password = null;
                    s.branch.State = StateEnum.update;
                    s.isBasicDisabled = s.branch.IsBasic;
                    
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
            co("G E T - getBranch", d);
        }).catch(err => {
            loading.hide();
            SMSSweet.alert(err.statusText, RequestTypeEnum.error);
            co("E R R O R - getBranch", err);
        })
    }

    //============= Saves =================

    s.saveChange = (form) => {
        if (form.$invalid) {
            s.branchFormSubmitErro = true;
            return;
        }

        s.branchFormSubmitErro = false;
        BlockingService.block();
        branchesServ.saveChange(s.branch).then(d => {
            BlockingService.unBlock();
            switch (d.data.RequestType) {
                case RequestTypeEnum.sucess: {
                    s.branch = d.data.Result;
                    s.branch.State = StateEnum.update;
                    s.isBasicDisabled = s.branch.IsBasic;

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
    s.getBranch();
}]);